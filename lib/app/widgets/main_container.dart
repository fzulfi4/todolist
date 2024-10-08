import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/themes/theme.dart';
import 'package:todolist_app/app/utils/utils_color_resources.dart';
import 'package:todolist_app/app/utils/utils_dimensions.dart';
import 'package:todolist_app/app/utils/utils_shadow.dart';

class MainContainer extends StatelessWidget {
  MainContainer({
    required this.child,
    super.key,
    this.padding,
    this.margin,
    this.color,
    this.height,
    this.width,
    this.shadow = false,
    this.borderRadius,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final bool? shadow;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: margin,
        padding: padding,
        height: height,
        decoration: BoxDecoration(
          color: themeController.isDarkMode.value
              ? color ?? UtilsColorResources.textDark
              : color ?? Colors.white,
          borderRadius: borderRadius ??
              BorderRadius.circular(UtilsDimensions.paddingSizeDefault),
          boxShadow: shadow != false ? [UtilsShadows.main] : null,
        ),
        width: width ?? MediaQuery.of(context).size.width,
        child: child,
      ),
    );
  }
}
