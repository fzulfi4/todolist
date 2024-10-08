import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/helper/helper_info_message.dart';
import 'package:todolist_app/app/helper/helper_local_storages.dart';
import 'package:todolist_app/app/modules/page/add_todo/models/add_todo_model.dart';
import 'package:todolist_app/app/modules/page/add_todo/repositories/add_todo_repo.dart';
import 'package:todolist_app/app/modules/page/home/controllers/home_controller.dart';
import 'package:todolist_app/app/widgets/main_dialog.dart';

class AddTodoController extends GetxController {
  //key
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  HomeController homeCtrl = Get.put(HomeController());
  //repo
  HelperLocalStorages localStorage = HelperLocalStorages();
  AddTodoRepo addtodoService = AddTodoRepo();

  //input
  TextEditingController todo = TextEditingController();
  //data
  RxBool obscureTextInput = true.obs;
  RxBool loadingAction = false.obs;

  Future<void> addtodo() async {
    final bool isValid = keyForm.currentState!.validate();

    if (!isValid) {
      return;
    }
    keyForm.currentState!.save();
    var jsonData = {
      'name': todo.text,
    };
    try {
      loadingAction.value = true;

      final AddTodoModel response =
          await addtodoService.addtodo(data: jsonData);

      if (response.statusCode == 2000) {
        Get.dialog(
          MainDialog(
            content: Text('Todo berhasil ditambahkan'.tr,
                textAlign: TextAlign.center),
            confirm: () {
              Get.back();
              Get.back();
              homeCtrl.ceklist();
            },
            textConfirm: 'selesai'.tr,
          ),
        );
        todo.clear();
      } else {
        HelperInfoMessage.showMessage(response.message);
      }
    } catch (error) {
      HelperInfoMessage.showMessage(error.toString());
    } finally {
      loadingAction.value = false;
    }
  }

  String? validateText(String? value) {
    if (value!.isEmpty) {
      return 'text_required'.tr;
    }
    return null;
  }
}
