import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/utils/utils_color_resources.dart';
import 'package:todolist_app/app/utils/utils_text_style.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.color,
    this.bottom,
    this.leading,
    this.actions,
    this.leadingWith,
    this.centerTitle,
    this.result,
    this.hideLeading,
    this.popScope,
  });

  final String? title;
  final Widget? titleWidget;
  final Color? color;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? leadingWith;
  final bool? centerTitle;
  final bool? result;
  final bool? hideLeading;
  final bool? popScope;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return popScope ?? false ? _popScop(context) : _app();
  }

  Widget _app() {
    return AppBar(
      centerTitle: centerTitle,
      leadingWidth: leadingWith,
      backgroundColor: color ?? UtilsColorResources.primaryColor,
      title: titleWidget ??
          Text(
            title?.tr.capitalize ?? '',
            style: UtilsTextStyle.textLargeBold.copyWith(color: Colors.white),
          ),
      bottom: bottom,
      leading: leading ??
          (hideLeading ?? false
              ? leading
              : IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    Get.back(result: result);
                  },
                )),
      actions: actions,
    );
  }

  Widget _popScop(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        if (Navigator.canPop(context)) {
          await Future.delayed(const Duration(milliseconds: 100));
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.back(result: result);
          });
        }
      },
      child: _app(),
    );
  }
}
