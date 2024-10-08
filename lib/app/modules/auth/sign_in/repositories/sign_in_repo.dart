import 'package:get/get.dart';
import 'package:todolist_app/app/helper/helper_client.dart';
import 'package:todolist_app/app/modules/auth/sign_in/models/sign_in_model.dart';

class SignRepo {
  final HelperClient _client = Get.find<HelperClient>();
  //Login Dokter
  Future<SignInModel> postSign({required Object data}) async {
    final Map<String, dynamic> response = await _client.post(
      'login',
      data: data,
    );

    return SignInModel.fromJson(response);
  }
}
