import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_gap.dart';
import '../../../constants/custom_size.dart';
import '../controller/add_transaction_controller.dart';

class TransactionContentType extends StatelessWidget {
  const TransactionContentType({super.key, required this.controller});

  final AddTransactionController controller;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        GestureDetector(
          onTap: controller.onChangePicture,
          child: Obx(() {
            final image = controller.image.value;
            return Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: AppColor.lightGrey,
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: image == null
                  ? const Icon(Icons.camera_alt_rounded,
                      color: AppColor.grey, size: 24)
                  : Image.file(File(image), fit: BoxFit.cover),
            );
          }),
        ),
        HorzGap.s,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jenis Transaksi",
                style: textTheme.labelMedium
                    ?.copyWith(color: AppColor.primaryDark),
              ),
              VertGap.xs,
              Obx(() {
                final type = controller.type.value;
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () => controller.setType("pemasukan"),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: CSize.sr,
                          vertical: CSize.xs,
                        ),
                        decoration: BoxDecoration(
                          color: type == "pemasukan"
                              ? AppColor.primaryLight.withOpacity(.15)
                              : AppColor.grey.withOpacity(.15),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(CSize.m)),
                        ),
                        child: Text(
                          "Pemasukan",
                          style: textTheme.bodySmall?.copyWith(
                            color: type == "pemasukan"
                                ? AppColor.primaryLight
                                : AppColor.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    HorzGap.xs,
                    GestureDetector(
                      onTap: () => controller.setType("pengeluaran"),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: CSize.sr,
                          vertical: CSize.xs,
                        ),
                        decoration: BoxDecoration(
                          color: type == "pengeluaran"
                              ? AppColor.red.withOpacity(.15)
                              : AppColor.grey.withOpacity(.15),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(CSize.m)),
                        ),
                        child: Text(
                          "Pengeluaran",
                          style: textTheme.bodySmall?.copyWith(
                            color: type == "pengeluaran"
                                ? AppColor.red
                                : AppColor.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              })
            ],
          ),
        )
      ],
    );
  }
}
