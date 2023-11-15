import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_gap.dart';
import '../../../constants/custom_size.dart';
import '../../../shareds/widget/bold_text.dart';
import '../../../shareds/widget/custom_text_field.dart';
import '../../../utils/format_currency.dart';
import '../controller/detail_transaction_controller.dart';

class DetailTransactionContent extends StatelessWidget {
  const DetailTransactionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.find<DetailTransactionController>();
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: CSize.m),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(CSize.l),
          topRight: Radius.circular(CSize.l),
        ),
        color: AppColor.white,
      ),
      child: Obx(() {
        final transaction = controller.transaction.value;
        final isOnEdit = controller.isOnEdit.value;
        if (transaction == null) return const SizedBox.shrink();
        final date = DateTime.parse(transaction.date!);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VertGap.m,
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primary10,
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.file(
                File(transaction.image!),
                fit: BoxFit.cover,
              ),
            ),
            VertGap.reg,
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: CSize.sr,
                vertical: CSize.xs,
              ),
              decoration: BoxDecoration(
                color: transaction.status == "pengeluaran"
                    ? AppColor.red.withOpacity(.15)
                    : AppColor.primary10,
                borderRadius: const BorderRadius.all(Radius.circular(CSize.m)),
              ),
              child: Text(
                transaction.status!.capitalizeFirst!,
                style: textTheme.bodySmall?.copyWith(
                  color: transaction.status == "pengeluaran"
                      ? AppColor.red
                      : AppColor.primaryLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            VertGap.xs,
            BoldText(
              text: "Rp${formatCurrency(transaction.amount!)}",
              fontWeight: FontWeight.bold,
              color: AppColor.black,
              fontSize: 24,
              overflow: TextOverflow.ellipsis,
            ),
            VertGap.m,
            TransactionContentItem(
              isOnEdit: isOnEdit,
              color: transaction.status == "pengeluaran"
                  ? AppColor.red
                  : AppColor.primaryLight,
              title: 'Tipe',
              content: transaction.status!.capitalizeFirst!,
            ),
            TransactionContentItem(
              isOnEdit: isOnEdit,
              title: transaction.status == "pengeluaran" ? 'Untuk' : 'Dari',
              content: transaction.name!,
            ),
            TransactionContentItem(
              isOnEdit: isOnEdit,
              title: 'Waktu',
              content: '${date.hour}:${date.minute}',
            ),
            TransactionContentItem(
              isOnEdit: isOnEdit,
              title: 'Tanggal',
              content: DateFormat('d MMMM y', "id_ID").format(date),
            ),
          ],
        );
      }),
    );
  }
}

class TransactionContentItem extends StatelessWidget {
  const TransactionContentItem({
    super.key,
    this.color,
    required this.title,
    required this.content,
    this.fontWeight,
    required this.isOnEdit,
  });

  final String title;
  final String content;
  final FontWeight? fontWeight;
  final Color? color;
  final bool isOnEdit;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme; 
    final controller = Get.find<DetailTransactionController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: CSize.s),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: textTheme.bodyMedium?.copyWith(color: AppColor.grey),
            ),
          ),
          if (isOnEdit && title == "Dari")
            Expanded(
              flex: 3,
              child: CTextField(
                onChanged: (name) => controller.transaction.value!.name = name,
                controller: TextEditingController(),
                focusNode: FocusNode(),
                enabled: true,
                hintText: content,
              ),
            )
          else
            Text(
              content,
              style: textTheme.bodyMedium?.copyWith(
                  color: color ?? AppColor.black, fontWeight: fontWeight),
            )
        ],
      ),
    );
  }
}
