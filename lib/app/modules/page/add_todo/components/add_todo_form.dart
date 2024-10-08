import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:todolist_app/app/modules/page/add_todo/controllers/add_todo_controller.dart';
import 'package:todolist_app/app/modules/page/add_todo/widgets/add_todo_button.dart';
import 'package:todolist_app/app/utils/utils_dimensions.dart';
import 'package:todolist_app/app/widgets/main_field.dart';

class AddTodoForm extends GetView<AddTodoController> {
  const AddTodoForm({
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
          const SizedBox(
            height: UtilsDimensions.paddingSizeDefault,
          ),
          MainField(
            nameControl: controller.todo,
            title: 'Todo'.tr,
            type: TextInputType.text,
            validator: controller.validateText,
          ),
          const SizedBox(
            height: UtilsDimensions.paddingSizeDefault,
          ),
          Obx(
            () => Skeletonizer(
              enabled: controller.loadingAction.value,
              child: const AddTodoButton(),
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
