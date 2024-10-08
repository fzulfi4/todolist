import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/utils/utils_color_resources.dart';
import 'package:todolist_app/app/utils/utils_text_style.dart';

class MainPrimaryButton extends StatelessWidget {
  const MainPrimaryButton({
    required this.press,
    super.key,
    this.isLoading,
    this.iconLeft,
    this.iconCenter,
    this.iconRight,
    this.color,
    this.textColor,
    this.borderColor,
    this.border,
    this.height,
    this.width,
    this.title,
    this.withIcon,
    this.fontSize = 16,
    this.titleStyle,
    this.borderRadius,
  });

  final String? title;
  final bool? isLoading;
  final VoidCallback press;
  final Widget? iconCenter;
  final Widget? iconRight;
  final Widget? iconLeft;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final bool? border;
  final double? height;
  final double? width;
  final bool? withIcon;
  final double? fontSize;
  final TextStyle? titleStyle;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.0,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 25),
            ),
          ),
          backgroundColor: color ?? UtilsColorResources.primaryColor,
          side: border ?? false
              ? BorderSide(
                  color: borderColor ?? Colors.red,
                )
              : null,
        ),
        onPressed: isLoading == true ? null : press,
        child: isLoading == true
            ? const Center(
                child: SizedBox(
                  height: 18.0,
                  width: 18.0,
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
            : withIcon ?? false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (iconLeft != null) iconLeft ?? Container(),
                      title?.isNotEmpty ?? false
                          ? Text(
                              title?.tr.capitalize ?? '',
                              style: titleStyle ??
                                  UtilsTextStyle.textLargeBold.copyWith(
                                    color: textColor ?? Colors.white,
                                    fontSize: fontSize,
                                  ),
                            )
                          : iconCenter ?? Container(),
                      if (iconRight != null) iconRight ?? Container(),
                    ],
                  )
                : Text(
                    title?.tr.capitalize ?? '',
                    style: titleStyle ??
                        UtilsTextStyle.textLargeBold.copyWith(
                          color: textColor ?? Colors.white,
                          fontSize: fontSize,
                        ),
                  ),
      ),
    );
  }
}
