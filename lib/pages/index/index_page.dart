import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../constants/custom_gap.dart';
import '../../shareds/widget/default_background.dart';
import 'controller/index_controller.dart';
import 'widget/index_balance.dart';
import 'widget/index_header.dart';
import 'widget/index_transactions.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final controller = Get.put<IndexController>(IndexController());

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DefaultBackground(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VertGap.m,
            VertGap.m,
            IndexHeader(),
            VertGap.m,
            IndexBalance(),
            VertGap.m,
            IndexTransactions()
          ],
        ),
      ),
    );
  }
}
