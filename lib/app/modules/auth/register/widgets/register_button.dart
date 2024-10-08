import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todolist_app/app/modules/auth/register/controllers/register_controller.dart';
import 'package:todolist_app/app/widgets/main_primary_button.dart';

class RegisterButton extends GetView<RegisterController> {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MainPrimaryButton(
        width: double.infinity,
        title: 'Daftarkan',
        press: () => controller.regis(),
      ),
    );
  }
}
