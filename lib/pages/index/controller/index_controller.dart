import 'dart:developer';

import 'package:get/state_manager.dart';

import '../../../models/model_transaction.dart';
import '../../../models/model_user.dart';
import '../../../services/sql/data/transaction/get_all_transactions.dart';
import '../../../services/sql/data/user/get_user.dart';
import '../../../utils/get_user_id.dart';

class IndexController extends GetxController {
  final Rx<String> username = "".obs;
  final Rx<int> balance = 0.obs;
  final Rx<int> income = 0.obs;
  final Rx<int> expense = 0.obs;
  final RxList<Transaction> recentTransactions = <Transaction>[].obs;

  Future<void> init() async {
    Future.wait([
      setUserState(),
      setTransactionsState(),
    ]);
  }

  Future<User> loadUserProfile() async {
    final userId = await getUserId();
    final response = await getUser(int.parse(userId.toString()));
    if (response.data != null) {
      log(response.data!.toJson().toString());
      return response.data!;
    } else {
      return User();
    }
  }

  Future<void> setUserState() async {
    final User user = await loadUserProfile();
    username.value = user.name ?? "";
    balance.value = user.balance ?? 0;
  }

  Future<List<Transaction>> loadTransactions() async {
    final now = DateTime.now();
    final response = await getAllTransactions(
      where: "AND strftime('%Y-%m', date) = '${now.year}-${now.month}'",
    );
    if (response.data != null) {
      log("asdasd${response.data}");
      return response.data!;
    } else {
      return [];
    }
  }

  Future<void> setTransactionsState() async {
    final transactions = await loadTransactions();
    income.value = 0;
    expense.value = 0;
    for (Transaction transaction in filterThisMonth(transactions)) {
      if (transaction.status == "pemasukan") {
        income.value += transaction.amount!;
      }
      if (transaction.status == "pengeluaran") {
        expense.value += transaction.amount!;
      }
    }
    recentTransactions.value = transactions.reversed.take(5).toList();
    for (var element in recentTransactions) {
      log(element.date!);
    }
  }

  List<Transaction> filterThisMonth(List<Transaction> transactions) {
    final result = transactions.where((transaction) {
      final now = DateTime.now();
      final date = DateTime.parse(transaction.date!);
      return date.year == now.year && date.month == now.month;
    }).toList();

    return result;
  }
}
