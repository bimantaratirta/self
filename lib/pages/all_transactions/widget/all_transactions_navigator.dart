import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_size.dart';
import '../controller/all_transactions_controller.dart';

class AllTransactionsNavigator extends StatelessWidget {
  const AllTransactionsNavigator({
    super.key,
    required this.controller,
    required this.textTheme,
  });

  final AllTransactionsController controller;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final type = controller.type.value;
      return Container(
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.all(Radius.circular(CSize.m)),
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => controller.setType("pemasukan"),
                child: AnimatedContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: CSize.reg,
                    vertical: CSize.sr,
                  ),
                  decoration: BoxDecoration(
                    color: type == "pemasukan"
                        ? AppColor.primaryLight.withOpacity(.15)
                        : Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(CSize.m),
                    ),
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    "Pemasukan",
                    style: textTheme.bodySmall?.copyWith(
                      color: type == "pemasukan"
                          ? AppColor.primaryLight
                          : AppColor.grey,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => controller.setType("pengeluaran"),
                child: AnimatedContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: CSize.reg,
                    vertical: CSize.sr,
                  ),
                  decoration: BoxDecoration(
                    color: type == "pengeluaran"
                        ? AppColor.red.withOpacity(.15)
                        : Colors.transparent,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(CSize.m)),
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    "Pengeluaran",
                    style: textTheme.bodySmall?.copyWith(
                      color:
                          type == "pengeluaran" ? AppColor.red : AppColor.grey,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
