import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../constants/app_colors.dart';
import '../../shareds/widget/bold_text.dart';
import 'controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = Get.put<SplashController>(SplashController());
  @override
  void initState() {
    controller.check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.primaryLight,
                AppColor.primaryDark,
              ],
            ),
          ),
          child: const BoldText(
            text: "Welcome to, Self",
            fontWeight: FontWeight.bold,
            color: AppColor.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
