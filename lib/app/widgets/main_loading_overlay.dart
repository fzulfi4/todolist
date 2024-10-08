import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/themes/theme.dart';
import 'package:todolist_app/app/utils/utils_color_resources.dart';
import 'package:todolist_app/app/utils/utils_dimensions.dart';
import 'package:todolist_app/app/utils/utils_shadow.dart';
import 'package:todolist_app/app/utils/utils_text_style.dart';

class MainLoadingOverlay extends StatelessWidget {
  MainLoadingOverlay({
    this.loading,
    super.key,
    this.color,
    this.child,
    this.title,
  });
  final Color? color;
  final String? title;
  final Widget? child;
  final bool? loading;
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (child != null) child ?? Container(),
        if (loading == true)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (loading == true)
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: themeController.isDarkMode.value
                    ? color ?? UtilsColorResources.textDark
                    : color ?? Colors.white,
                borderRadius:
                    BorderRadius.circular(UtilsDimensions.radiusDefault),
                boxShadow: [UtilsShadows.main],
              ),
              child: const CircularProgressIndicator(),
            ),
          ),
        Text(
          title?.tr ?? '',
          textAlign: TextAlign.center,
          style: UtilsTextStyle.textDefaultBold.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
