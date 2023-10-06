import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../../constants/custom_size.dart';
import '../../../shareds/widget/default_card.dart';
import '../controller/all_transactions_controller.dart';
import 'expense_transactions.dart';
import 'income_transactions.dart';

class AllTransactionsContent extends StatelessWidget {
  const AllTransactionsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AllTransactionsController>();
    return Expanded(
      child: DefaultCard(
        padding: const EdgeInsets.symmetric(
          horizontal: CSize.reg,
          vertical: CSize.xs,
        ),
        child: PageView(
          controller: controller.pageController.value,
          physics: const NeverScrollableScrollPhysics(),
          dragStartBehavior: DragStartBehavior.down,
          onPageChanged: (idx) {
            controller.setType(idx == 0 ? "pemasukan" : "pengeluaran");
          },
          children: const [
            IncomeTransactions(),
            ExpenseTransactions(),
          ],
        ),
      ),
    );
  }
}
