import 'package:flutter/material.dart';

import '../../constants/custom_gap.dart';
import '../../shareds/widget/default_background.dart';
import 'widget/index_balance.dart';
import 'widget/index_header.dart';
import 'widget/index_transactions.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

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
