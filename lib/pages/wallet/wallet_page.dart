import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_gap.dart';
import '../../constants/custom_size.dart';
import '../../shareds/widget/bold_text.dart';
import '../../shareds/widget/default_background.dart';
import '../../utils/format_currency.dart';
import 'widget/wallet_buttons.dart';
import 'widget/wallet_recent_transactions.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: DefaultBackground(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            VertGap.xh,
            VertGap.xh,
            Expanded(
              child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: CSize.m),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(CSize.l),
                    topRight: Radius.circular(CSize.l),
                  ),
                  color: AppColor.white,
                ),
                child: Column(
                  children: [
                    VertGap.xh,
                    Text(
                      "Total Saldo",
                      style: textTheme.titleMedium
                          ?.copyWith(color: AppColor.darkGrey),
                    ),
                    VertGap.s,
                    BoldText(
                      text: "Rp${formatCurrency(5328538125)}",
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    VertGap.m,
                    const WalletButtons(),
                    VertGap.m,
                    const WalletRecentTransactions(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


