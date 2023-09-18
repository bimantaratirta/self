import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:self/shareds/widget/bold_text.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_routes.dart';
import '../../constants/custom_gap.dart';
import '../../constants/custom_size.dart';
import '../../shareds/widget/custom_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SvgPicture.asset(
              'assets/background/welcome-bg.svg',
              alignment: Alignment.topCenter,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: CSize.m,
                  horizontal: CSize.xh,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/illustrations/man.png', width: 400),
                    VertGap.reg,
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BoldText(
                          text: "Mengelola Keuangan",
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: AppColor.primaryLight,
                        ),
                        BoldText(
                          text: "Mudah & Efisien",
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: AppColor.primaryLight,
                        ),
                      ],
                    ),
                    VertGap.reg,
                    CButton(
                      type: ButtonType.elevated,
                      text: "Mulai Sekarang",
                      foregroundColor: AppColor.white,
                      shadowColor: AppColor.primaryLight,
                      onPressed: () => Get.offNamed(AppRoute.regist),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
