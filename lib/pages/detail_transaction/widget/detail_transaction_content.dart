import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_gap.dart';
import '../../../constants/custom_size.dart';
import '../../../shareds/widget/bold_text.dart';
import '../../../utils/format_currency.dart';

class DetailTransactionContent extends StatelessWidget {
  const DetailTransactionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: CSize.reg),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(CSize.l),
          topRight: Radius.circular(CSize.l),
        ),
        color: AppColor.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VertGap.m,
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.primary10,
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network(
              'https://dummyimage.com/100x100',
              fit: BoxFit.cover,
            ),
          ),
          VertGap.reg,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: CSize.sr,
              vertical: CSize.xs,
            ),
            decoration: BoxDecoration(
              color: AppColor.red.withOpacity(.15),
              borderRadius: const BorderRadius.all(Radius.circular(CSize.m)),
            ),
            child: Text(
              "Pemasukan",
              style: textTheme.bodySmall?.copyWith(
                color: AppColor.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          VertGap.xs,
          BoldText(
            text: "Rp${formatCurrency(50000)}",
            fontWeight: FontWeight.bold,
            color: AppColor.black,
            fontSize: 24,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
