import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/app_colors.dart';
import 'constants/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Self',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: AppColor.primarySwatch,
          backgroundColor: AppColor.white,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(textTheme),
      ),
      initialRoute: AppRoute.splash,
      getPages: AppRoute.pages,
    );
  }
}
