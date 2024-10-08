import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/utils/utils_color_resources.dart';
import 'package:todolist_app/app/utils/utils_dimensions.dart';
import 'package:todolist_app/app/utils/utils_text_style.dart';
import 'package:todolist_app/app/widgets/main_dialog.dart';

// ignore: avoid_classes_with_only_static_members
class HelperInfoMessage {
  static void showMessage(String message) {
    Get.dialog(
      MainDialog(
        title: 'warning'.tr,
        content: Text(
          message.tr,
          style: UtilsTextStyle.textSmall,
        ),
        buttonCancelColor: UtilsColorResources.greyColor,
        textCancelColor: UtilsColorResources.greyColor,
        textConfirm: 'back'.tr,
        confirm: () => Get.back(),
      ),
    );
  }

  static void messageOn(
      {String? message,
      String? subMessage,
      String? iconAnimation,
      VoidCallback? tap,
      String? textButton}) {
    Get.dialog(
      MainDialog(
        title: message?.tr,
        content: Column(
          children: [
            Text(
              subMessage?.tr ?? '',
              style: UtilsTextStyle.textSmallOpacity,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        textConfirm: textButton?.tr.toUpperCase(),
        confirm: tap,
      ),
    );
  }

  static void bottomMassage({Widget? child}) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(UtilsDimensions.paddingSizeDefault),
              topRight: Radius.circular(UtilsDimensions.paddingSizeDefault),
            ),
          ),
          child: child,
        ),
      ),
      isScrollControlled: true,
    );
  }
}
