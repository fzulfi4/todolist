import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/utils/utils_color_resources.dart';
import 'package:todolist_app/app/utils/utils_dimensions.dart';

class MainField extends StatelessWidget {
  const MainField({
    required this.nameControl,
    required this.title,
    required this.type,
    super.key,
    this.validator,
    this.tooltip,
    this.ontap,
    this.icon,
    this.enabled,
    this.readOnly,
    this.primary,
    this.richMessage,
    this.inlineSpan,
    this.onlyNumber,
    this.onChange,
    this.none,
    this.password,
    this.maxLines,
    this.minLines,
    this.borderRadius,
  });

  final TextEditingController nameControl;
  final String title;
  final String? tooltip;
  final TextInputType type;
  final String? Function(String?)? validator;
  final VoidCallback? ontap;
  final Widget? icon;
  final bool? enabled;
  final bool? readOnly;
  final bool? primary;
  final bool? richMessage;
  final bool? onlyNumber;
  final bool? none;
  final List<InlineSpan>? inlineSpan;
  final Function(String)? onChange;
  final bool? password;
  final int? maxLines;
  final int? minLines;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: GetPlatform.isIOS && (onlyNumber ?? false)
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : null,
      readOnly: readOnly ?? false,
      enabled: enabled,
      obscureText: password ?? false,
      onTap: ontap,
      controller: nameControl,
      onChanged: onChange,
      keyboardType: type,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.all(
          UtilsDimensions.paddingSizeSmall,
        ),
        label: none ?? false
            ? null
            : primary ?? false
                ? RichText(
                    text: TextSpan(
                      text: title.tr,
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(text: '*'),
                      ],
                    ),
                  )
                : null,
        suffixIcon: icon != null
            ? richMessage != false
                ? Tooltip(
                    margin: const EdgeInsets.symmetric(
                        horizontal: UtilsDimensions.paddingSizeSmall),
                    padding:
                        const EdgeInsets.all(UtilsDimensions.paddingSizeSmall),
                    showDuration: const Duration(seconds: 20),
                    decoration: ShapeDecoration(
                      color: UtilsColorResources.primaryColor,
                      shape: ToolTipCustomShape(context),
                    ),
                    preferBelow: false,
                    triggerMode: TooltipTriggerMode.tap,
                    richMessage: TextSpan(
                        text: '',
                        style: const TextStyle(color: Colors.white),
                        children: inlineSpan),
                    child: icon,
                  )
                : Tooltip(
                    message: tooltip ?? '',
                    triggerMode: TooltipTriggerMode.tap,
                    child: icon,
                  )
            : icon,
        hintText: title.tr,
        border: OutlineInputBorder(
          borderRadius: borderRadius ??
              BorderRadius.circular(UtilsDimensions.paddingSizeDefault),
          borderSide: BorderSide(
            width: 2.0,
            color: UtilsColorResources.primaryColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ??
              BorderRadius.circular(UtilsDimensions.paddingSizeDefault),
          borderSide: BorderSide(
            width: 2.0,
            color: UtilsColorResources.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ??
              BorderRadius.circular(UtilsDimensions.paddingSizeDefault),
          borderSide: BorderSide(
            color: UtilsColorResources.primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ??
              BorderRadius.circular(UtilsDimensions.paddingSizeDefault),
          borderSide: BorderSide(
            width: 2.0,
            color: UtilsColorResources.primaryColor,
          ),
        ),
      ),
    );
  }
}

class ToolTipCustomShape extends ShapeBorder {
  final bool usePadding;
  final BuildContext context;

  const ToolTipCustomShape(this.context, {this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect =
        Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 20));
    return Path()
      ..addRRect(RRect.fromRectAndRadius(
          rect, const Radius.circular(UtilsDimensions.radiusDefault)))
      ..moveTo(rect.bottomCenter.dx - MediaQuery.of(context).size.width / 4,
          rect.bottomCenter.dy)
      ..relativeLineTo(MediaQuery.of(context).size.width / 75, 20)
      ..relativeLineTo(MediaQuery.of(context).size.width / 20, -20)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
