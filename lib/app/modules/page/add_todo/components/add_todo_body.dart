import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/modules/page/add_todo/components/add_todo_form.dart';
import 'package:todolist_app/app/modules/page/add_todo/controllers/add_todo_controller.dart';
import 'package:todolist_app/app/utils/utils_dimensions.dart';

class AddTodoBody extends GetView<AddTodoController> {
  const AddTodoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: UtilsDimensions.paddingSizeDefault),
      width: double.infinity,
      child: const AddTodoForm(),
    );
  }
}
