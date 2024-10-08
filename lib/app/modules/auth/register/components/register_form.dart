import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:todolist_app/app/modules/auth/register/controllers/register_controller.dart';
import 'package:todolist_app/app/modules/auth/register/widgets/register_button.dart';
import 'package:todolist_app/app/utils/utils_dimensions.dart';
import 'package:todolist_app/app/widgets/main_field.dart';

class RegisterForm extends GetView<RegisterController> {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keyForm,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainField(
            nameControl: controller.email,
            title: 'email'.tr,
            type: TextInputType.emailAddress,
            validator: controller.validateEmail,
          ),
          const SizedBox(
            height: UtilsDimensions.paddingSizeDefault,
          ),
          MainField(
            nameControl: controller.username,
            title: 'username'.tr,
            type: TextInputType.name,
            validator: controller.validateUsername,
          ),
          const SizedBox(
            height: UtilsDimensions.paddingSizeDefault,
          ),
          MainField(
            nameControl: controller.password,
            title: 'password'.tr,
            type: TextInputType.visiblePassword,
            validator: controller.validatePassword,
            password: true,
          ),
          const SizedBox(
            height: UtilsDimensions.paddingSizeDefault,
          ),
          Obx(
            () => Skeletonizer(
              enabled: controller.loadingAction.value,
              child: const RegisterButton(),
            ),
          ),
          const SizedBox(
            height: UtilsDimensions.paddingSizeDefault,
          ),
        ],
      ),
    );
  }
}
