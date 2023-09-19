import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_size.dart';

class DetailTransactionAppBar extends StatelessWidget {
  const DetailTransactionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CSize.m),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: Get.back,
            child: const Icon(
              Icons.keyboard_arrow_left_rounded,
              color: AppColor.white,
            ),
          ),
          Text(
            "Detil Transaksi",
            style: textTheme.titleMedium?.copyWith(
              color: AppColor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () => debugPrint("MENU"),
            child: const Icon(
              Icons.more_horiz_rounded,
              color: AppColor.white,
            ),
          )
        ],
      ),
    );
  }
}
