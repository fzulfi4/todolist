import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/helper/helper_info_message.dart';
import 'package:todolist_app/app/modules/auth/register/models/register_model.dart';
import 'package:todolist_app/app/modules/auth/register/repositories/register_repo.dart';
import 'package:todolist_app/app/utils/utils_dimensions.dart';
import 'package:todolist_app/app/utils/utils_images.dart';
import 'package:todolist_app/app/widgets/main_dialog.dart';

class RegisterController extends GetxController {
  //key
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  //repo
  RegisterRepo registerService = RegisterRepo();
  //input
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  //data
  RxBool obscureTextInput = true.obs;
  RxBool loadingAction = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> regis() async {
    final bool isValid = keyForm.currentState!.validate();

    if (!isValid) {
      return;
    }
    keyForm.currentState!.save();

    var jsonData = {
      'email': email.text,
      'username': username.text,
      'password': password.text,
    };

    try {
      loadingAction.value = true;

      final RegisterModel response =
          await registerService.register(data: jsonData);

      if (response.statusCode != 2000) {
        Get.dialog(
          MainDialog(
            content: Column(
              children: [
                Image.asset(UtilsImages.avatar, width: 200.0, height: 200.0),
                const SizedBox(
                  height: UtilsDimensions.paddingSizeDefault,
                ),
                Text('akun telah dibuat'.tr, textAlign: TextAlign.center),
              ],
            ),
            confirm: () {
              Get.back();
              Get.back();
              email.clear();
              username.clear();
              password.clear();
            },
            textConfirm: 'selesai'.tr,
          ),
        );
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

  String? validateUsername(String? value) {
    if (value!.isEmpty) {
      return 'username_required'.tr;
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
