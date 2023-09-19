import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryDark = Color(0xFF2A7C76);
  static const Color primaryLight = Color(0xFF429690);
  static const Color primary10 = Color(0xFFECF9F8);
  static const Color red = Color(0xFFF95B51);
  static const Color green = Color(0xFF25A969);
  static const Color orange = Color(0xFFFFAB7B);
  static const Color black = Color(0xFF222222);
  static const Color grey = Color(0xFFAAAAAA);
  static const Color darkGrey = Color(0xFF666666);
  static const Color lightGrey = Color(0xFFF4F6F6);
  static const Color white = Color(0xFFFFFFFF);

  static final MaterialColor primarySwatch = MaterialColor(
    primaryLight.value,
    const <int, Color>{
      50: Color(0xFFE0F2F1),
      100: Color(0xFFB2DFDB),
      200: Color(0xFF80CBC4),
      300: Color(0xFF4DB6AC),
      400: Color(0xFF26A69A),
      500: primaryLight,
      600: Color(0xFF00897B),
      700: Color(0xFF00796B),
      800: Color(0xFF00695C),
      900: Color(0xFF004D40),
    },
  );
}
