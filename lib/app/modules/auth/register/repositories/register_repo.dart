import 'package:get/get.dart';
import 'package:todolist_app/app/helper/helper_client.dart';
import 'package:todolist_app/app/modules/auth/register/models/register_model.dart';

class RegisterRepo {
  final HelperClient _client = Get.find<HelperClient>();

  Future<RegisterModel> register({required Object data}) async {
    final Map<String, dynamic> response = await _client.post(
      '/register',
      data: data,
    );

    return RegisterModel.fromJson(response);
  }
}
