import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../constants/app_colors.dart';

class AddTransactionAppBar extends StatelessWidget {
  const AddTransactionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        GestureDetector(
          onTap: Get.back,
          child: const Icon(
            Icons.keyboard_arrow_left_rounded,
            color: AppColor.white,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Transaksi Baru",
              style: textTheme.titleMedium?.copyWith(
                color: AppColor.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
