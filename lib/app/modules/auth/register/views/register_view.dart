import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/modules/auth/register/components/register_body.dart';
import 'package:todolist_app/app/modules/auth/register/controllers/register_controller.dart';
import 'package:todolist_app/app/widgets/main_app_bar.dart';
import 'package:todolist_app/app/widgets/main_loading_overlay.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MainAppBar(
          color: Colors.transparent,
          hideLeading: true,
        ),
      ),
      body: Obx(
        () => MainLoadingOverlay(
          loading: controller.loadingAction.value,
          child: const RegisterBody(),
        ),
      ),
    );
  }
}
