import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_gap.dart';
import '../../../shareds/widget/custom_text_field.dart';
import '../../../shareds/widget/default_card.dart';
import '../controller/add_transaction_controller.dart';

class AddTransactionContent extends StatelessWidget {
  const AddTransactionContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.find<AddTransactionController>();
    return DefaultCard(
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: controller.onChangePicture,
                child: Obx(() {
                  final image = controller.image.value;
                  return Container(
                    width: 75,
                    height: 75,
                    decoration: const BoxDecoration(
                      color: AppColor.lightGrey,
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: image == null
                        ? const Icon(
                            Icons.camera_alt_rounded,
                            color: AppColor.grey,
                            size: 24,
                          )
                        : Image.file(File(image), fit: BoxFit.cover),
                  );
                }),
              ),
              HorzGap.reg,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Transaksi",
                      style: textTheme.labelMedium?.copyWith(
                        color: AppColor.primaryDark,
                      ),
                    ),
                    VertGap.xs,
                    CTextField(
                      onChanged: (_) {},
                      controller: controller.nameC,
                      focusNode: controller.nameFN,
                      enabled: true,
                      onTapOutside: (_) => controller.nameFN.unfocus(),
                      hintText: "Beli sesuatu",
                    ),
                  ],
                ),
              )
            ],
          ),
          VertGap.reg,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jumlah Uang",
                style: textTheme.labelMedium?.copyWith(
                  color: AppColor.primaryDark,
                ),
              ),
              VertGap.xs,
              CTextField(
                onChanged: (_) {},
                controller: controller.nameC,
                focusNode: controller.nameFN,
                enabled: true,
                onTapOutside: (_) => controller.nameFN.unfocus(),
                hintText: "Beli sesuatu",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
