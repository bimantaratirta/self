import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_gap.dart';
import '../../shareds/widget/default_background.dart';
import 'controller/all_transactions_controller.dart';
import 'widget/all_transactions_content.dart';
import 'widget/all_transactions_navigator.dart';

class AllTransactionsPage extends StatefulWidget {
  const AllTransactionsPage({super.key});

  @override
  State<AllTransactionsPage> createState() => _AllTransactionsPageState();
}

class _AllTransactionsPageState extends State<AllTransactionsPage> {
  final controller = Get.put<AllTransactionsController>(
    AllTransactionsController(),
  );

  @override
  void initState() {
    controller.loadAllTransactions();
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<AllTransactionsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: DefaultBackground(
        child: Column(
          children: [
            VertGap.xh,
            Row(
              children: [
                GestureDetector(
                  onTap: Get.back,
                  child: const Icon(
                    Icons.keyboard_arrow_left_rounded,
                    color: AppColor.white,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Semua Transaksi",
                      style: textTheme.titleMedium?.copyWith(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            VertGap.reg,
            AllTransactionsNavigator(
              controller: controller,
              textTheme: textTheme,
            ),
            VertGap.reg,
            const AllTransactionsContent(),
            VertGap.reg,
          ],
        ),
      ),
    );
  }
}




