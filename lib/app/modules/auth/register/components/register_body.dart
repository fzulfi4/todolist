import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/modules/auth/register/components/register_form.dart';
import 'package:todolist_app/app/modules/auth/register/controllers/register_controller.dart';
import 'package:todolist_app/app/utils/utils_color_resources.dart';
import 'package:todolist_app/app/utils/utils_dimensions.dart';
import 'package:todolist_app/app/utils/utils_images.dart';
import 'package:todolist_app/app/utils/utils_text_style.dart';

class RegisterBody extends GetView<RegisterController> {
  const RegisterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                  color: UtilsColorResources.primaryColor,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
              ),
              _decorationCircleIcon(
                bottom: 250,
                left: 0,
                right: 0,
                child: Text(
                  'Daftar',
                  style: UtilsTextStyle.textDefaultBold
                      .copyWith(fontSize: 56, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              _decorationCircleIcon(
                bottom: -90,
                left: 0,
                right: 0,
                child: Image.asset(
                  UtilsImages.apps,
                  width: 350,
                  height: 350,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: UtilsDimensions.paddingSizeDefault,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: UtilsDimensions.paddingSizeDefault),
            width: double.infinity,
            child: const RegisterForm(),
          ),
        ],
      ),
    );
  }
}

Widget _decorationCircleIcon(
    {double? bottom, double? left, double? top, double? right, Widget? child}) {
  return Positioned(
    top: top,
    bottom: bottom,
    left: left,
    right: right,
    child: child ?? Container(),
  );
}