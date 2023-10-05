import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../../../constants/app_colors.dart';
import '../../../shareds/widget/bold_text.dart';
import '../controller/index_controller.dart';

class IndexHeader extends StatelessWidget {
  const IndexHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.find<IndexController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Selamat sore,",
          style: textTheme.bodyMedium?.copyWith(color: AppColor.white),
        ),
        Obx(() {
          final String username = controller.username.value;
          return BoldText(
            text: username,
            fontWeight: FontWeight.bold,
            color: AppColor.white,
            fontSize: 20,
            overflow: TextOverflow.ellipsis,
          );
        })
      ],
    );
  }
}
