import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_gap.dart';
import '../../../constants/custom_size.dart';
import '../../../shareds/widget/custom_button.dart';
import '../../../shareds/widget/custom_text_field.dart';
import '../../../shareds/widget/default_card.dart';
import '../controller/add_transaction_controller.dart';

class AddTransactionContent extends StatelessWidget {
  const AddTransactionContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddTransactionController>();
    final textTheme = Theme.of(context).textTheme;
    return DefaultCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TransactionContentType(controller: controller),
          VertGap.reg,
          Obx(() {
            final type = controller.type.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type == "pengeluaran" ? "Untuk" : "Dari",
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
                  hintText: type == "pengeluaran" ? "Beli sesuatu" : "Gaji",
                ),
              ],
            );
          }),
          VertGap.reg,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jumlah(Rp)",
                style: textTheme.labelMedium?.copyWith(
                  color: AppColor.primaryDark,
                ),
              ),
              VertGap.xs,
              CTextField(
                onChanged: (_) {},
                controller: controller.amountC,
                focusNode: controller.amountFN,
                enabled: true,
                keryboardType: TextInputType.number,
                onTapOutside: (_) => controller.amountFN.unfocus(),
                hintText: "100000",
              ),
            ],
          ),
          VertGap.reg,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Biaya lainnya(Rp)",
                style: textTheme.labelMedium?.copyWith(
                  color: AppColor.primaryDark,
                ),
              ),
              VertGap.xs,
              CTextField(
                onChanged: (_) {},
                controller: controller.feeC,
                focusNode: controller.feeFN,
                enabled: true,
                keryboardType: TextInputType.number,
                onTapOutside: (_) => controller.feeFN.unfocus(),
                hintText: "15000",
              ),
            ],
          ),
          VertGap.reg,
          TransactionContentDateTime(controller: controller),
          VertGap.reg,
          CButton(
            type: ButtonType.elevated,
            text: "Simpan",
            foregroundColor: AppColor.white,
            elevation: 0,
            onPressed: controller.onSave,
          ),
        ],
      ),
    );
  }
}

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

class TransactionContentDateTime extends StatelessWidget {
  const TransactionContentDateTime({super.key, required this.controller});

  final AddTransactionController controller;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tanggal & Waktu",
          style: textTheme.labelMedium?.copyWith(
            color: AppColor.primaryDark,
          ),
        ),
        VertGap.xs,
        GestureDetector(
          onTap: () => showDateTimePicker(context),
          child: Obx(() {
            return CTextField(
              onChanged: (_) {},
              controller: TextEditingController(),
              focusNode: FocusNode(),
              enabled: false,
              suffix: const Icon(
                Icons.calendar_month_rounded,
                color: AppColor.grey,
              ),
              hintText:
                  controller.date.value == null || controller.time.value == null
                      ? DateFormat('d MMMM y', "id_ID")
                          .add_jm()
                          .format(DateTime.now().toLocal())
                      : "${controller.date.value!} ${controller.time.value!}",
              hintStyle: textTheme.bodyMedium,
            );
          }),
        )
      ],
    );
  }

  void showDateTimePicker(BuildContext context) {
    final controller = Get.find<AddTransactionController>();
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 5000)),
      lastDate: DateTime.now().add(const Duration(days: 5000)),
      cancelText: "Batal",
      confirmText: "Lanjut",
    ).then((date) {
      controller.date.value = date!.toIso8601String();
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        cancelText: "Batal",
        confirmText: "Simpan",
      ).then((time) {
        controller.time.value = time!.format(context);
        controller.date.value = DateFormat('d MMMM y', "id_ID").format(date);
      });
    });
  }
}
