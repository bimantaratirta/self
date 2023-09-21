import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_gap.dart';
import '../../../constants/custom_size.dart';
import '../../../shareds/widget/bold_text.dart';
import '../../../shareds/widget/custom_divider.dart';
import '../../../utils/format_currency.dart';

class DetailTransactionContent extends StatelessWidget {
  const DetailTransactionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
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
              "Pengeluaran",
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
          VertGap.m,
          const TransactionContentItem(
            color: AppColor.red,
            title: 'Tipe',
            content: 'Pengeluaran',
          ),
          const TransactionContentItem(title: 'Untuk', content: 'Beli Seblack'),
          const TransactionContentItem(title: 'Waktu', content: '16:30'),
          const TransactionContentItem(
            title: 'Tanggal',
            content: '29 Agustus 2023',
          ),
          const CDivider(height: CSize.m, thickness: 2),
          TransactionContentItem(
            title: 'Pengeluaran',
            content: 'Rp${formatCurrency(20000)}',
          ),
          TransactionContentItem(
            title: 'Biaya lainnya',
            content: 'Rp${formatCurrency(1500)}',
          ),
          const CDivider(height: CSize.m, thickness: 2),
          TransactionContentItem(
            title: 'Total',
            content: 'Rp${formatCurrency(21500)}',
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

class TransactionContentItem extends StatelessWidget {
  const TransactionContentItem({
    super.key,
    this.color,
    required this.title,
    required this.content,
    this.fontWeight,
  });

  final String title;
  final String content;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: CSize.s),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.bodyMedium?.copyWith(color: AppColor.grey),
          ),
          Text(
            content,
            style: textTheme.bodyMedium?.copyWith(
                color: color ?? AppColor.black, fontWeight: fontWeight),
          )
        ],
      ),
    );
  }
}
