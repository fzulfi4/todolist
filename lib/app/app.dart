import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/config/app_config.dart';
import 'package:todolist_app/app/routes/app_pages.dart';
import 'package:todolist_app/app/themes/theme.dart';

class TodolistApp extends StatefulWidget {
  const TodolistApp({super.key});

  @override
  State<TodolistApp> createState() => _TodolistAppState();
}

class _TodolistAppState extends State<TodolistApp> {
  final ThemeController themeController = Get.put(ThemeController());
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: Obx(() {
        return GetMaterialApp(
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown
            },
          ),
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          title: AppConfig.appName,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          theme: themeController.theme,
        );
      }),
    );
  }
}
