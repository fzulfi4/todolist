import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/modules/page/home/components/home_body.dart';
import 'package:todolist_app/app/modules/page/home/controllers/home_controller.dart';
import 'package:todolist_app/app/widgets/main_app_bar.dart';
import 'package:todolist_app/app/widgets/main_loading_overlay.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MainAppBar(
          hideLeading: true,
          title: 'Home',
        ),
      ),
      body: Obx(
        () => MainLoadingOverlay(
          loading: controller.loadingAction.value,
          child: const HomeBody(),
        ),
      ),
    );
  }
}
