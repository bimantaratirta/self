import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_info.dart';
import '../../constants/custom_size.dart';
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
  void dispose() {
    Get.delete<SplashController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(CSize.m),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            const BoldText(
              text: "Selamat datang di Self!",
              fontWeight: FontWeight.bold,
              color: AppColor.white,
              fontSize: 24,
            ),
            Text(
              AppInfo.version,
              style: textTheme.labelMedium?.copyWith(color: AppColor.white),
            )
          ],
        ),
      ),
    );
  }
}
