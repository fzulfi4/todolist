import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:todolist_app/app/modules/auth/sign_in/controllers/sign_in_controller.dart';
import 'package:todolist_app/app/modules/auth/sign_in/widgets/sign_in_button.dart';
import 'package:todolist_app/app/modules/auth/sign_in/widgets/sign_in_regis_button.dart';
import 'package:todolist_app/app/utils/utils_dimensions.dart';
import 'package:todolist_app/app/widgets/main_field.dart';

class SignInForm extends GetView<SignInController> {
  const SignInForm({
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
            nameControl: controller.username,
            title: 'username'.tr,
            type: TextInputType.name,
            validator: controller.validateEmail,
          ),
          const SizedBox(
            height: UtilsDimensions.paddingSizeDefault,
          ),
          MainField(
            nameControl: controller.password,
            title: 'password'.tr,
            type: TextInputType.name,
            validator: controller.validatePassword,
            password: true,
          ),
          const SizedBox(
            height: UtilsDimensions.paddingSizeDefault,
          ),
          Obx(
            () => Skeletonizer(
              enabled: controller.loadingAction.value,
              child: const SignInButton(),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          Obx(
            () => Skeletonizer(
              enabled: controller.loadingAction.value,
              child: const SignInRegisButton(),
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
