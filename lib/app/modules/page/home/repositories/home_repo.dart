import 'package:get/get.dart';
import 'package:todolist_app/app/helper/helper_client.dart';
import 'package:todolist_app/app/modules/page/home/models/home_model.dart';

class HomeRepo {
  final HelperClient _client = Get.find<HelperClient>();

  Future<HomeModel> checklist() async {
    final Map<String, dynamic> response = await _client.get(
      '/checklist',
    );

    return HomeModel.fromJson(response);
  }

  Future<HomeModel> deleteCeklist(int id) async {
    final Map<String, dynamic> response = await _client.delete(
      '/checklist/$id',
    );

    return HomeModel.fromJson(response);
  }
}
