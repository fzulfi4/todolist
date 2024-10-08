import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todolist_app/app/modules/page/home/controllers/home_controller.dart';
import 'package:todolist_app/app/widgets/main_primary_button.dart';

class HomeButton extends GetView<HomeController> {
  const HomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MainPrimaryButton(
        width: double.infinity,
        title: 'Daftarkan',
        press: () => controller.ceklist(),
      ),
    );
  }
}
