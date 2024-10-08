import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/helper/helper_client.dart';
import 'package:todolist_app/app/helper/helper_info_message.dart';
import 'package:todolist_app/app/helper/helper_local_storages.dart';
import 'package:todolist_app/app/modules/auth/sign_in/models/sign_in_model.dart';
import 'package:todolist_app/app/modules/auth/sign_in/repositories/sign_in_repo.dart';
import 'package:todolist_app/app/routes/app_pages.dart';

class SignInController extends GetxController {
  //key
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  //repo
  HelperLocalStorages localStorage = HelperLocalStorages();
  SignRepo signInService = SignRepo();
  //input
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  //data
  RxBool obscureTextInput = true.obs;
  RxBool loadingAction = false.obs;

  final HelperClient _client = Get.find<HelperClient>();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> signIn() async {
    final bool isValid = keyForm.currentState!.validate();

    if (!isValid) {
      return;
    }
    keyForm.currentState!.save();
    var jsonData = {
      'username': username.text,
      'password': password.text,
    };

    try {
      loadingAction.value = true;

      final SignInModel response = await signInService.postSign(data: jsonData);

      if (response.statusCode == 2110) {
        _client.setToken(response.data?.token);
        Get.offNamedUntil(
          Routes.HOME,
          // ignore: unrelated_type_equality_checks
          (route) => route.settings.name == false,
        );
        username.clear();
        password.clear();
      } else {
        HelperInfoMessage.showMessage(response.message);
      }
    } catch (error) {
      HelperInfoMessage.showMessage(error.toString());
    } finally {
      loadingAction.value = false;
    }
  }

  void secureText() {
    obscureTextInput.toggle();
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'email_required'.tr;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'password_required'.tr;
    } else {
      return null;
    }
  }
}
