import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_gap.dart';
import '../../../shareds/widget/custom_text_field.dart';
import '../controller/add_transaction_controller.dart';

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
              hintText: controller.date.value == null ||
                      controller.time.value == null
                  ? DateFormat('d MMMM y', "id_ID")
                      .add_jm()
                      .format(DateTime.now().toLocal())
                  : "${DateFormat('d MMMM y', "id_ID").format(DateTime.parse(controller.date.value!))} ${controller.time.value!}",
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
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        cancelText: "Batal",
        confirmText: "Simpan",
      ).then((time) {
        final finalDate = DateTime(
          date!.year,
          date.month,
          date.day,
          time!.hour,
          time.minute,
        );
        controller.time.value = time.format(context);
        controller.date.value = finalDate.toIso8601String();
        controller.stateChecker();
      });
    });
  }
}
