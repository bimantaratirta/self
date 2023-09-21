import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../constants/custom_gap.dart';
import '../../shareds/widget/default_background.dart';
import 'controller/detail_transaction_controller.dart';
import 'widget/detail_transaction_app_bar.dart';
import 'widget/detail_transaction_content.dart';

class DetailTransactionPage extends StatefulWidget {
  const DetailTransactionPage({super.key});

  @override
  State<DetailTransactionPage> createState() => _DetailTransactionPageState();
}

class _DetailTransactionPageState extends State<DetailTransactionPage> {
  final controller = Get.put<DetailTransactionController>(
    DetailTransactionController(),
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<DetailTransactionController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DefaultBackground(
        padding: EdgeInsets.zero,
        child: SingleChildScrollView(
          child: Column(
            children: [
              VertGap.xh,
              DetailTransactionAppBar(),
              VertGap.xh,
              DetailTransactionContent(),
            ],
          ),
        ),
      ),
    );
  }
}
