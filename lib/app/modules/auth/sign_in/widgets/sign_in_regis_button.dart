import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/modules/auth/sign_in/controllers/sign_in_controller.dart';
import 'package:todolist_app/app/routes/app_pages.dart';
import 'package:todolist_app/app/widgets/main_primary_button.dart';

class SignInRegisButton extends GetView<SignInController> {
  const SignInRegisButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MainPrimaryButton(
        width: double.infinity,
        title: 'daftar',
        press: () => Get.toNamed(Routes.REGISTER),
      ),
    );
  }
}
