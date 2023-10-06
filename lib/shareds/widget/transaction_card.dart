import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_routes.dart';
import '../../constants/custom_gap.dart';
import '../../constants/custom_size.dart';
import '../../models/model_transaction.dart';
import 'bold_text.dart';
import '../../utils/format_currency.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final id = transaction.id;
    return InkWell(
      onTap: () => Get.toNamed(AppRoute.detailTransaction, arguments: id),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(CSize.s),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(CSize.xs),
                    ),
                    color: AppColor.primary10,
                  ),
                  child: Image.file(
                    File(transaction.image!),
                    fit: BoxFit.contain,
                  ),
                ),
                HorzGap.sr,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.name ?? "-",
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      VertGap.s,
                      Text(
                        getDateStatus(),
                        style: textTheme.titleSmall?.copyWith(
                          color: AppColor.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BoldText(
              text:
                  "${transaction.status == 'pemasukan' ? '+' : '-'} Rp${formatCurrency(transaction.amount!)}",
              fontWeight: FontWeight.bold,
              color: transaction.status == 'pemasukan'
                  ? AppColor.green
                  : AppColor.red,
              fontSize: 16,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }

  String getDateStatus() {
    final date = DateTime.parse(transaction.date!);
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return 'Hari ini, ${date.hour}:${date.minute}';
    } else if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Kemarin, ${date.hour}:${date.minute}';
    } else {
      return '${DateFormat('d MMM y', "id_ID").format(date)} ${date.hour}:${date.minute}';
    }
  }
}
