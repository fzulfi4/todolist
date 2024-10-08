import 'package:flutter/material.dart';
import 'package:todolist_app/app/helper/helper_material_color_generator.dart';

mixin UtilsColorResources {
  static HelperMaterialColorGenerator materialThemeColor =
      HelperMaterialColorGenerator();
  static Color primaryColor = const Color(0xFF3F82F3);
  static Color secondaryColor = const Color(0xFF80B2D6);
  static Color tertiaryColor = const Color(0xFF4D93C6);
  static const Color blackColor = Color(0xFF252E4E);
  static const Color greyColor = Color.fromARGB(255, 136, 142, 148);
  static const Color redColor = Color(0xFFEB5757);
  static const Color blueColor = Color.fromARGB(255, 44, 92, 205);
  static const Color backgroundColor = Color.fromARGB(255, 246, 246, 246);
  static const Color dividerColor = Color.fromARGB(137, 195, 195, 195);
  static Color secondColor = const Color(0xFFD4AA80);

  static const Color softBlue = Color.fromARGB(108, 212, 227, 255);
  static const Color softGreen = Color.fromARGB(131, 213, 255, 213);
  static const Color softYelow = Color.fromARGB(136, 255, 255, 210);
  static const Color softRed = Color.fromARGB(136, 252, 195, 195);
  static Color card = const Color(0xFFE0ECF5);

  static Color textDark = const Color(0xFF1C1B1F);

  static Map<int, Color> colorMap = {
    50: const Color(0xFFE0ECF5),
    100: const Color(0xFFB3D1E6),
    200: const Color(0xFF80B2D6),
    300: const Color(0xFF4D93C6),
    400: const Color(0xFF267BB9),
    500: const Color(0xFF3F82F3),
    600: const Color(0xFF005CA6),
    700: const Color(0xFF00529C),
    800: const Color(0xFF004893),
    900: const Color(0xFF003683),
  };

  static MaterialColor primaryMaterial =
      MaterialColor(primaryColor.value, colorMap);

  static void initWithColor(
      {Color? primary, Map<int, Color>? colorSwatch, int? colorAppTheme}) {
    if (colorAppTheme != null && colorAppTheme != 0) {
      setColorTheme(colorAppTheme);
    } else {
      if (colorSwatch == null) return;

      colorMap = colorSwatch;
      primaryColor = primary ?? const Color(0xFF3F82F3);
      secondaryColor = primary ?? const Color(0xFF80B2D6);
      tertiaryColor = primary ?? const Color(0xFF4D93C6);

      primaryMaterial = MaterialColor(primaryColor.value, colorSwatch);
    }
  }

  static void setColorTheme(int colorAppTheme) {
    primaryColor = Color(colorAppTheme);

    primaryMaterial =
        materialThemeColor.generateMaterialColor(color: Color(colorAppTheme));

    final Map<int, Color> colorTheme = {
      50: primaryMaterial.shade50,
      100: primaryMaterial.shade100,
      200: primaryMaterial.shade200,
      300: primaryMaterial.shade300,
      400: primaryMaterial.shade400,
      500: primaryMaterial.shade500,
      600: primaryMaterial.shade600,
      700: primaryMaterial.shade700,
      800: primaryMaterial.shade800,
      900: primaryMaterial.shade900,
    };

    colorMap = colorTheme;

    secondaryColor = colorMap[200] ?? const Color(0xFF80B2D6);
    tertiaryColor = colorMap[300] ?? const Color(0xFF4D93C6);
  }
}
