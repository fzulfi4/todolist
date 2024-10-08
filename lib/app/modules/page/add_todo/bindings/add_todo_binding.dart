import 'package:get/get.dart';
import 'package:todolist_app/app/modules/page/add_todo/controllers/add_todo_controller.dart';

class AddTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTodoController>(
      () => AddTodoController(),
    );
  }
}
