import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/utils/utils_color_resources.dart';
import 'package:todolist_app/app/utils/utils_dimensions.dart';
import 'package:todolist_app/app/utils/utils_text_style.dart';
import 'package:todolist_app/app/widgets/main_container.dart';

class MainDialog extends StatelessWidget {
  const MainDialog({
    super.key,
    this.title,
    this.titleColor,
    this.titleIcon,
    this.content,
    this.list,
    this.textCancel,
    this.textCancelColor,
    this.buttonCancelColor,
    this.textConfirm,
    this.textConfirmColor,
    this.confirm,
    this.buttonConfirmColor,
    this.buttonConfirmBorderColor,
    this.cancel,
  });
  final String? title;
  final Icon? titleIcon;
  final Color? titleColor;
  final Widget? content;
  final bool? list;
  final String? textCancel;
  final Color? textCancelColor;
  final Color? buttonCancelColor;
  final String? textConfirm;
  final Color? textConfirmColor;
  final VoidCallback? confirm;
  final Color? buttonConfirmColor;
  final Color? buttonConfirmBorderColor;
  final VoidCallback? cancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          child: MainContainer(
            padding: const EdgeInsets.all(UtilsDimensions.paddingSizeDefault),
            margin: const EdgeInsets.all(UtilsDimensions.paddingSizeSmall),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (titleIcon != null) titleIcon ?? Container(),
                    if (titleIcon != null)
                      const SizedBox(
                        width: UtilsDimensions.paddingSizeSmall,
                      ),
                    Expanded(
                      child: Text(
                        title?.tr ?? '',
                        textAlign: TextAlign.center,
                        style: UtilsTextStyle.textDefaultBold.copyWith(
                            color:
                                titleColor ?? UtilsColorResources.primaryColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: UtilsDimensions.paddingSizeDefault),
                list ?? false
                    ? SizedBox(
                        height: 400,
                        child: ListView(
                          children: [
                            content ?? Container(),
                          ],
                        ),
                      )
                    : content ?? Container(),
                if (cancel != null && confirm != null)
                  const SizedBox(height: UtilsDimensions.paddingSizeDefault),
                //Buttons
                const SizedBox(height: UtilsDimensions.paddingSizeDefault),
                Row(
                  children: [
                    if (cancel != null)
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(0, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: buttonCancelColor ?? Colors.grey,
                              ),
                            ),
                          ),
                          onPressed: cancel,
                          child: Text(
                            textCancel?.tr ?? '',
                            style: UtilsTextStyle.textSmall.copyWith(
                                color: textCancelColor ?? Colors.grey),
                          ),
                        ),
                      ),
                    if (textCancel != null && textConfirm != null)
                      const SizedBox(width: UtilsDimensions.paddingSizeDefault),
                    if (confirm != null)
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 45),
                            backgroundColor: buttonConfirmColor ??
                                UtilsColorResources.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: buttonConfirmBorderColor ??
                                    UtilsColorResources.primaryColor,
                              ),
                            ),
                          ),
                          onPressed: confirm,
                          child: Text(
                            textConfirm?.tr ?? '',
                            style: UtilsTextStyle.textSmall.copyWith(
                                color: textConfirmColor ?? Colors.white),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
