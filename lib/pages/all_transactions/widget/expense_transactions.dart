import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../../../constants/custom_gap.dart';
import '../../../models/model_transaction.dart';
import '../../../shareds/widget/transaction_card.dart';
import '../controller/all_transactions_controller.dart';

class ExpenseTransactions extends StatelessWidget {
  const ExpenseTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AllTransactionsController>();
    return SingleChildScrollView(
      child: Obx(() {
        final listTransactions = controller.transactions;
        return Column(
          children: [
            VertGap.s,
            for (Transaction transaction in listTransactions.where(
                (transaction) => transaction.status == "pengeluaran")) ...[
              TransactionCard(transaction: transaction),
              VertGap.s,
            ]
          ],
        );
      }),
    );
  }
}
