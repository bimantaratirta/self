import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_routes.dart';
import '../../../models/model_transaction.dart';
import '../../../services/sql/data/transaction/delete_transaction.dart';
import '../../../services/sql/data/transaction/get_transaction.dart';
import '../../../services/sql/data/transaction/update_transaction.dart';
import '../../../shareds/widget/custom_button.dart';

class DetailTransactionController extends GetxController {
  Rx<Transaction?> transaction = Rx<Transaction?>(null);
  Rx<bool> isOnEdit = false.obs;

  void loadTransaction(int id) async {
    final response = await getTransaction(id);
    if (response.data != null) transaction.value = response.data;
  }

  void onSave() async {
    await updateTransaction(transaction.value!);
    final response = await getTransaction(transaction.value!.id!);
    if (response.data != null) transaction.value = response.data!;
    isOnEdit.value = false;
  }

  void onMenuSelected(String value) {
    switch (value) {
      case "Edit":
        isOnEdit.value = true;
        break;
      case "Hapus":
        Get.dialog(AlertDialog(
          title: const Text("Apakah kamu yakin ingin menghapus transaksi ini?"),
          actions: [
            CButton(
              type: ButtonType.text,
              text: "Tidak",
              onPressed: Get.back,
              elevation: 0,
              foregroundColor: AppColor.darkGrey,
            ),
            CButton(
              type: ButtonType.elevated,
              text: "Hapus",
              onPressed: () async {
                await deleteTransaction(transaction.value!.id!);
                Get.offAllNamed(AppRoute.navigation);
              },
              elevation: 0,
              foregroundColor: AppColor.white,
            )
          ],
        ));
        break;
    }
  }
}
