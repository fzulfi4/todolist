import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todolist_app/app/modules/auth/sign_in/controllers/sign_in_controller.dart';
import 'package:todolist_app/app/widgets/main_primary_button.dart';

class SignInButton extends GetView<SignInController> {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MainPrimaryButton(
        width: double.infinity,
        title: 'masuk',
        press: () => controller.signIn(),
      ),
    );
  }
}
