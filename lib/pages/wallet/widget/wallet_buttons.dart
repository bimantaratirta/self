import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_routes.dart';
import '../../../constants/custom_gap.dart';
import '../../../constants/custom_size.dart';
import '../../add_transaction/controller/add_transaction_controller.dart';

class WalletButtons extends StatelessWidget {
  const WalletButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Get.put<AddTransactionController>(
              AddTransactionController(),
            ).type.value = "pemasukan";
            Get.toNamed(AppRoute.addTransaction);
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(CSize.s),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: AppColor.primaryLight,
                  ),
                ),
                child: const Icon(
                  Icons.add_rounded,
                  color: AppColor.primaryLight,
                  size: 32,
                ),
              ),
              VertGap.xs,
              Text(
                "Tambah",
                style: textTheme.bodySmall?.copyWith(
                  color: AppColor.darkGrey,
                ),
              )
            ],
          ),
        ),
        HorzGap.xh,
        GestureDetector(
          onTap: () {
            Get.put<AddTransactionController>(
              AddTransactionController(),
            ).type.value = "pengeluaran";
            Get.toNamed(AppRoute.addTransaction);
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(CSize.s),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: AppColor.primaryLight,
                  ),
                ),
                child: Image.asset(
                  "assets/icons/send.png",
                  width: 31,
                  height: 31,
                ),
              ),
              VertGap.xs,
              Text(
                "Bayar",
                style: textTheme.bodySmall?.copyWith(
                  color: AppColor.darkGrey,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
