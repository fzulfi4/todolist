import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist_app/app/helper/helper_client.dart';
import 'package:todolist_app/app/modules/auth/sign_in/controllers/sign_in_controller.dart';

Future<void> initLib() async {
  await GetStorage.init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Init client wrapper untuk digunakan di berbagai kode repo
  Get.put<HelperClient>(
    HelperClient(),
    permanent: true,
  );

  Get.lazyPut(() => SignInController(), fenix: true);
}
