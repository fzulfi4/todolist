import 'package:get/get.dart';
import 'package:todolist_app/app/helper/helper_client.dart';
import 'package:todolist_app/app/modules/page/add_todo/models/add_todo_model.dart';

class AddTodoRepo {
  final HelperClient _client = Get.find<HelperClient>();

  Future<AddTodoModel> addtodo({required Object data}) async {
    final Map<String, dynamic> response = await _client.post(
      '/checklist',
      data: data,
    );

    return AddTodoModel.fromJson(response);
  }
}
