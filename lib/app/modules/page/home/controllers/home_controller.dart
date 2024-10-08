import 'dart:async';

import 'package:get/get.dart';
import 'package:todolist_app/app/helper/helper_info_message.dart';
import 'package:todolist_app/app/helper/helper_local_storages.dart';
import 'package:todolist_app/app/modules/page/home/models/home_model.dart';
import 'package:todolist_app/app/modules/page/home/repositories/home_repo.dart';

class HomeController extends GetxController {
  //repo
  HelperLocalStorages localStorage = HelperLocalStorages();
  HomeRepo homeService = HomeRepo();
  RxList<Item> item = <Item>[].obs;

  //data
  RxBool obscureTextInput = true.obs;
  RxBool loadingAction = false.obs;

  @override
  void onInit() {
    ceklist();
    super.onInit();
  }

  Future<void> ceklist() async {
    try {
      loadingAction.value = true;

      final HomeModel response = await homeService.checklist();

      if (response.statusCode != 2000) {
        item.value = response.data ?? [];
      } else {
        HelperInfoMessage.showMessage(response.message);
      }
    } catch (error) {
      HelperInfoMessage.showMessage(error.toString());
    } finally {
      loadingAction.value = false;
    }
  }

  Future<void> deleteCeklist(int id) async {
    try {
      loadingAction.value = true;

      final HomeModel response = await homeService.deleteCeklist(id);

      if (response.statusCode == 2300) {
        HelperInfoMessage.showMessage(response.message);
        ceklist();
      }
    } catch (error) {
      HelperInfoMessage.showMessage(error.toString());
    } finally {
      loadingAction.value = false;
    }
  }
}
