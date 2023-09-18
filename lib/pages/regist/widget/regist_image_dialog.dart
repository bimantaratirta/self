import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_gap.dart';
import '../../../constants/custom_size.dart';
import '../../../shareds/widget/custom_button.dart';
import '../controller/regist_controller.dart';

class RegistImageDialog extends StatelessWidget {
  const RegistImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegistController>();
    final imagePath = controller.image.value;
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(CSize.reg),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(CSize.reg)),
          color: AppColor.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(CSize.s)),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.file(File(imagePath!)),
            ),
            VertGap.reg,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CButton(
                  type: ButtonType.outlined,
                  text: "Tutup",
                  foregroundColor: AppColor.primaryLight,
                  elevation: 0,
                  onPressed: Get.back,
                ),
                HorzGap.s,
                CButton(
                  type: ButtonType.elevated,
                  text: "Ganti",
                  foregroundColor: AppColor.white,
                  elevation: 0,
                  onPressed: controller.pickImage,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
