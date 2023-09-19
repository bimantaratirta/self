import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_routes.dart';
import '../../../constants/custom_gap.dart';
import '../../../constants/custom_size.dart';
import '../../../models/model_transaction.dart';
import '../../../shareds/widget/bold_text.dart';
import '../../../utils/format_currency.dart';

class IndexTransactionsCard extends StatelessWidget {
  const IndexTransactionsCard({super.key, required this.transaction});

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
                  child: Image.network(
                    transaction.image!,
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
                        "Hari ini",
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
          BoldText(
            text:
                "${transaction.status == 'pemasukan' ? '+' : '-'} Rp${formatCurrency(transaction.amount)}",
            fontWeight: FontWeight.bold,
            color: transaction.status == 'pemasukan'
                ? AppColor.green
                : AppColor.red,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
