import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:get_storage/get_storage.dart';
// import 'package:todolist/app/modules/profile/controllers/profile_controller.dart';
import 'package:todolist_app/app/config/app_config.dart';
import 'package:todolist_app/app/helper/helper_local_storages.dart';
import 'package:todolist_app/app/helper/helper_status_sign_in.dart';
import 'package:todolist_app/app/routes/app_pages.dart';
import 'package:todolist_app/app/utils/utils_dimensions.dart';
import 'package:todolist_app/app/utils/utils_images.dart';
import 'package:todolist_app/app/widgets/main_dialog.dart';

/// Wrap http client
class HelperClient {
  static GetStorage box = GetStorage();
  Dio? _dio;

  HelperClient() {
    _dio = Dio();

    /// Set default header
    _dio?.options.headers = _headers();
    _dio?.options.baseUrl = AppConfig.baseUrl();

    _dio?.interceptors.add(InterceptorsWrapper(
      onError: _errorInterceptor,
    ));
  }

  void setToken(String? token) {
    _dio?.options.headers.remove('Authorization');

    if (token?.isNotEmpty ?? false) {
      _dio?.options.headers['Authorization'] = 'Bearer $token';

      HelperClient.box.write(HelperLocalStorages.bearerToken, token);
    }
  }

  Future<void> _refreshToken() async {
    try {
      final Dio dio = Dio(_dio?.options);

      final Response response =
          await dio.post('/auth_dokter/refresh_token_dokter');

      if (response.statusCode == 200 && response.data != null) {
        final Map<String, dynamic> jsonData =
            response.data as Map<String, dynamic>;

        setToken(jsonData['access_token']);
      }
    } on DioException catch (e) {
      debugPrint('Refresh token failure: ${e.message}');

      await _promptRelogin();
    }
  }

  Future<Response<dynamic>?> _retryRequest(
      RequestOptions requestOptions) async {
    try {
      final headers = requestOptions.headers;
      headers['Authorization'] =
          'Bearer ${_dio?.options.headers['Authorization']}';

      final options = Options(
        method: requestOptions.method,
        headers: headers,
      );

      final Dio dio = Dio();
      dio.options.baseUrl = AppConfig.baseUrl();

      return dio.request<dynamic>(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      debugPrint('Retry request failure: ${e.message}');

      await _promptRelogin();
    }

    return null;
  }

  Map<String, dynamic> _headers() {
    final String? bearerToken =
        HelperClient.box.read(HelperLocalStorages.bearerToken);
    final Map<String, dynamic> headerHttpRequest = {'name': AppConfig.appName};

    if (bearerToken?.isNotEmpty ?? false) {
      headerHttpRequest['Authorization'] = 'Bearer $bearerToken';
    }

    return headerHttpRequest;
  }

  Future<void> _errorInterceptor(
      DioException error, ErrorInterceptorHandler handler) async {
    // Intercept 401 not authorized status code
    if (error.response?.statusCode == 401 &&
        error.requestOptions.headers['Authorization'] != null) {
      await _refreshToken();

      final retryResponse = await _retryRequest(error.requestOptions);

      if (retryResponse?.statusCode == 200) {
        return handler
            .resolve(retryResponse!); // Return here to stop further execution
      } else if (retryResponse?.statusCode == 401) {
        await _promptRelogin();
      }
    }

    // Call handler.reject() outside of the if block to handle other error cases
    handler.reject(error);
  }

  void _handleError(DioException e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.response != null) {
      debugPrint(e.response?.data.toString());
      debugPrint(e.response?.headers.toString());
      debugPrint(e.response?.requestOptions.toString());

      throw Exception((e.response?.data as Map<String, dynamic>)['message'] ??
          e.response?.statusCode);
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      debugPrint(e.requestOptions.toString());
      debugPrint(e.message);

      throw Exception(
          e.message!.isNotEmpty ? e.message : e.response?.statusCode);
    }
  }

  Future<void> _promptRelogin() async {
    final HelperStatusSignIn statusSignInHelper = HelperStatusSignIn();

    if (statusSignInHelper.isSignIn()) {
      // final ProfileController settingController =
      //     getx.Get.find<ProfileController>();
      // await settingController.signOut();

      final bool? relogin = await getx.Get.dialog<bool>(
        MainDialog(
          content: Column(
            children: [
              Image.asset(UtilsImages.avatar, width: 200.0, height: 200.0),
              Text('session_expired'.tr, textAlign: TextAlign.center),
            ],
          ),
          confirm: () {
            getx.Get.back(result: true);
          },
          textConfirm: 'sign_in'.tr.toUpperCase(),
          cancel: () {
            getx.Get.back(result: false);
          },
          textCancel: 'cancel'.tr.toUpperCase(),
        ),
      );

      if (relogin ?? false) {
        await getx.Get.offNamedUntil(
          Routes.SIGNIN,
          (route) {
            final routeName = route.settings.name;

            debugPrint('Checking route: $routeName');

            return routeName == Routes.HOME;
          },
        );
      }
    } else {
      await getx.Get.dialog(
        MainDialog(
          content: Column(
            children: [
              Image.asset(UtilsImages.avatar, width: 200.0, height: 200.0),
              const SizedBox(
                height: UtilsDimensions.paddingSizeDefault,
              ),
              Text('before_signin'.tr, textAlign: TextAlign.center),
            ],
          ),
          confirm: () {
            getx.Get.offAllNamed(Routes.SIGNIN);
            getx.Get.toNamed(Routes.SIGNIN);
          },
          textConfirm: 'sign_in'.tr,
        ),
      );
    }
  }

  Future<Map<String, dynamic>> get(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      VoidCallbackAction? reload}) async {
    try {
      final Response? response = await _dio?.get(url,
          queryParameters: queryParameters, options: options);

      final Map<String, dynamic> responseJson =
          response?.data as Map<String, dynamic>;

      return responseJson;
    } on DioException catch (e) {
      _handleError(e);
    }

    return {};
  }

  Future<List<int>> getFile(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response? response = await _dio?.get(url,
          queryParameters: queryParameters,
          options: Options(
            responseType: ResponseType.bytes,
          ));

      return response?.data;
    } on DioException catch (e) {
      _handleError(e);
    }

    return [];
  }

  Future<Map<String, dynamic>> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
  }) async {
    try {
      final Response? response = await _dio?.post(
        url,
        queryParameters: queryParameters,
        data: data,
        options: options,
      );

      final Map<String, dynamic> responseJson =
          response?.data as Map<String, dynamic>;

      return responseJson;
    } on DioException catch (e) {
      _handleError(e);
    }

    return {};
  }

  Future<Map<String, dynamic>> delete(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response? response =
          await _dio?.delete(url, queryParameters: queryParameters);

      final Map<String, dynamic> responseJson =
          response?.data as Map<String, dynamic>;

      return responseJson;
    } on DioException catch (e) {
      _handleError(e);
    }

    return {};
  }

  Future<Map<String, dynamic>> put(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response? response =
          await _dio?.put(url, queryParameters: queryParameters);

      final Map<String, dynamic> responseJson =
          response?.data as Map<String, dynamic>;

      return responseJson;
    } on DioException catch (e) {
      _handleError(e);
    }

    return {};
  }
}
