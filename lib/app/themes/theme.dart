import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/helper/helper_client.dart';
import 'package:todolist_app/app/helper/helper_local_storages.dart';
import 'package:todolist_app/app/utils/utils_color_resources.dart';
import 'package:todolist_app/app/utils/utils_text_style.dart';

class ThemeController extends GetxController {
  // Define light and dark themes
  final lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      primary: UtilsColorResources.primaryColor,
      secondary: UtilsColorResources.secondaryColor,
    ),
    appBarTheme: appBarTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    textButtonTheme: textButtonTheme,
    tabBarTheme: tabBarThemeData,
    cardTheme: cardTheme,
    dividerTheme: DividerThemeData(
      color: Colors.grey[100],
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      primary: UtilsColorResources.primaryColor,
      secondary: UtilsColorResources.secondaryColor,
    ),
    appBarTheme: appBarTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    textButtonTheme: textButtonTheme,
    tabBarTheme: tabBarThemeData,
    inputDecorationTheme: inputDecorationTheme,
    cardTheme: cardTheme,
    dividerTheme: const DividerThemeData(
      color: Colors.black12,
    ),
  );

  // Observable for current theme mode
  RxBool isDarkMode = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Load the theme from storage, defaulting to false if not set
    isDarkMode.value =
        HelperClient.box.read(HelperLocalStorages.isDarkMode) ?? false;
  }

  // Toggle theme method
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    HelperClient.box.write(HelperLocalStorages.isDarkMode, isDarkMode.value);
  }

  // // Get current theme
  // ThemeData get theme =>
  //     box.read(HelperLocalStorages.isDarkMode) ?? true ? darkTheme : lightTheme;

  // Get current theme
  ThemeData get theme => isDarkMode.value ? darkTheme : lightTheme;
}

TabBarTheme tabBarThemeData = TabBarTheme(
  indicatorSize: TabBarIndicatorSize.label,
  unselectedLabelStyle: UtilsTextStyle.textDefault,
  labelStyle: UtilsTextStyle.textDefaultBold,
  overlayColor: WidgetStateProperty.all(Colors.transparent),
  labelColor: UtilsColorResources.primaryColor,
  indicatorColor: UtilsColorResources.primaryColor,
);

CardTheme cardTheme = const CardTheme(color: Colors.white);

MaterialColor primarySwatch = UtilsColorResources.primaryMaterial;

TextButtonThemeData textButtonTheme = TextButtonThemeData(
  style: ButtonStyle(
    overlayColor: WidgetStateProperty.all(Colors.transparent),
    foregroundColor: WidgetStateProperty.all(UtilsColorResources.primaryColor),
    textStyle: WidgetStateProperty.all(
      UtilsTextStyle.textDefaultBold
          .copyWith(color: UtilsColorResources.primaryColor),
    ),
  ),
);

OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
  style: ButtonStyle(
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: UtilsColorResources.primaryColor),
      ),
    ),
    textStyle: WidgetStateProperty.all(
      const TextStyle(fontWeight: FontWeight.w800, fontSize: 16.0),
    ),
  ),
);

ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    shadowColor: WidgetStateProperty.all(Colors.transparent),
    shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
    elevation: WidgetStateProperty.all(0),
    textStyle: WidgetStateProperty.all(
      const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 16.0,
      ),
    ),
    overlayColor: WidgetStateProperty.all(Colors.transparent),
  ),
);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
  labelStyle: const TextStyle(
      color: UtilsColorResources.blackColor, fontWeight: FontWeight.w500),
  hintStyle: const TextStyle(color: UtilsColorResources.greyColor),
  border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0))),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(width: 2.0, color: UtilsColorResources.primaryColor),
  ),
);

AppBarTheme appBarTheme = const AppBarTheme(
  titleTextStyle: TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 18.0,
  ),
  iconTheme: IconThemeData(
    color: Colors.white, //change your color here
  ),
  elevation: 0.0,
  centerTitle: true,
  backgroundColor: UtilsColorResources.blackColor,
);
