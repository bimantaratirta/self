import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_gap.dart';
import '../../widget/custom_button.dart';
import '../../widget/default_background.dart';
import '../../widget/default_card.dart';
import 'controller/storage_permission_controller.dart';

class StoragePermissionPage extends StatelessWidget {
  StoragePermissionPage({super.key});

  final onPermited = Get.arguments ?? Get.back;

  final controller =
      Get.put<StoragePermissionController>(StoragePermissionController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: DefaultBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              DefaultCard(
                child: Column(
                  children: [
                    Text(
                      "Kami memerlukan izin penyimpanan",
                      style: textTheme.titleMedium,
                    ),
                    VertGap.reg,
                    CButton(
                      type: ButtonType.elevated,
                      text: "Berikan izin",
                      foregroundColor: AppColor.white,
                      onPressed: () => controller.requestPermission(onPermited),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
