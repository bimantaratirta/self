import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_gap.dart';
import '../../../constants/custom_size.dart';
import '../controller/detail_transaction_controller.dart';

class DetailTransactionAppBar extends StatelessWidget {
  const DetailTransactionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.find<DetailTransactionController>();
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
          Obx(() {
            final isOnEdit = controller.isOnEdit.value;
            if (isOnEdit) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: controller.onSave,
                    child: const Icon(
                      Icons.check_rounded,
                      color: AppColor.white,
                      size: 24,
                    ),
                  ),
                  HorzGap.s,
                  GestureDetector(
                    onTap: () => controller.isOnEdit.value = false,
                    child: const Icon(
                      Icons.close_rounded,
                      color: AppColor.white,
                      size: 24,
                    ),
                  ),
                ],
              );
            }
            return PopupMenuButton(
              onSelected: controller.onMenuSelected,
              itemBuilder: (ctx) {
                return [
                  PopupMenuItem(
                    value: "Edit",
                    child: Text(
                      "Edit",
                      style: textTheme.bodyMedium,
                    ),
                  ),
                  PopupMenuItem(
                    value: "Hapus",
                    child: Text(
                      "Hapus",
                      style: textTheme.bodyMedium,
                    ),
                  ),
                ];
              },
              child: const Icon(
                Icons.more_horiz_rounded,
                color: AppColor.white,
              ),
            );
          })
        ],
      ),
    );
  }
}
