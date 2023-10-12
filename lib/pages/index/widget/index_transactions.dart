import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_routes.dart';
import '../../../constants/custom_gap.dart';
import '../../../models/model_transaction.dart';
import '../../../shareds/widget/transaction_card.dart';
import '../controller/index_controller.dart';

class IndexTransactions extends StatelessWidget {
  const IndexTransactions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.find<IndexController>();
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transaksi Bulan Ini",
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(AppRoute.allTransaction),
                child: const Text(
                  "Semua",
                  style: TextStyle(color: AppColor.grey),
                ),
              ),
            ],
          ),
          VertGap.reg,
          Expanded(
            child: SingleChildScrollView(
              child: Obx(() {
                final recentTransactions = controller.recentTransactions;
                if (recentTransactions.isEmpty) {
                  return Text(
                    'Tekan tombol "+" di bawah untuk membuat transaksi baru!',
                    style: textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  );
                }
                return Column(
                  children: [
                    for (Transaction transaction in recentTransactions) ...[
                      TransactionCard(transaction: transaction),
                      VertGap.sr,
                    ]
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
