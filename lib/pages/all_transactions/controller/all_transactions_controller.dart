import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class AllTransactionsController extends GetxController {
  Rx<String> type = "pemasukan".obs;
  Rx<PageController> pageController = PageController().obs;

  void setType(String type) {
    this.type.value = type;
    pageController.value.animateToPage(
      type == "pemasukan" ? 0 : 1,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }
}
