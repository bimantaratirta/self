import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

import '../../../models/model_transaction.dart';
import '../../../services/sql/data/transaction/get_all_transactions.dart';

class AllTransactionsController extends GetxController {
  Rx<String> type = "pemasukan".obs;
  Rx<PageController> pageController = PageController().obs;
  RxList<Transaction> transactions = RxList<Transaction>();

  void setType(String type) {
    this.type.value = type;
    pageController.value.animateToPage(
      type == "pemasukan" ? 0 : 1,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  Future<void> loadAllTransactions() async {
    final response = await getAllTransactions();
    if (response.data != null) transactions.value = response.data!;
  }
}
