import 'package:flutter/material.dart';

import '../../constants/custom_gap.dart';
import '../../shareds/widget/default_background.dart';
import 'widget/detail_transaction_app_bar.dart';
import 'widget/detail_transaction_content.dart';

class DetailTransactionPage extends StatelessWidget {
  const DetailTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DefaultBackground(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            VertGap.xh,
            DetailTransactionAppBar(),
            VertGap.xh,
            Expanded(child: DetailTransactionContent())
          ],
        ),
      ),
    );
  }
}
