import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/modules/page/add_todo/components/add_todo_body.dart';
import 'package:todolist_app/app/modules/page/add_todo/controllers/add_todo_controller.dart';
import 'package:todolist_app/app/widgets/main_app_bar.dart';
import 'package:todolist_app/app/widgets/main_loading_overlay.dart';

class AddTodoView extends GetView<AddTodoController> {
  const AddTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MainAppBar(
          title: 'AddTodo',
        ),
      ),
      body: Obx(
        () => MainLoadingOverlay(
          loading: controller.loadingAction.value,
          child: const AddTodoBody(),
        ),
      ),
    );
  }
}
