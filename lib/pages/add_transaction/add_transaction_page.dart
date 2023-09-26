import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../constants/custom_gap.dart';
import '../../shareds/widget/default_background.dart';
import 'controller/add_transaction_controller.dart';
import 'widget/add_transaction_app_bar.dart';
import 'widget/add_transaction_content.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final controller = Get.put<AddTransactionController>(
    AddTransactionController(),
  );

  @override
  void dispose() {
    Get.delete<AddTransactionController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DefaultBackground(
        child: Column(
          children: [
            VertGap.xh,
            AddTransactionAppBar(),
            VertGap.xh,
            AddTransactionContent()
          ],
        ),
      ),
    );
  }
}
