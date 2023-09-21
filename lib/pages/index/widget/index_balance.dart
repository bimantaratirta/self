import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_gap.dart';
import '../../../constants/custom_size.dart';
import '../../../shareds/widget/bold_text.dart';
import '../../../utils/format_currency.dart';

class IndexBalance extends StatelessWidget {
  const IndexBalance({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(CSize.reg),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(CSize.reg),
        ),
        color: AppColor.primaryDark,
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(.25),
            offset: const Offset(1.0, 5.0),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Saldo Kamu",
            style: textTheme.titleMedium?.copyWith(
              color: AppColor.white.withOpacity(.8),
              fontWeight: FontWeight.bold,
            ),
          ),
          BoldText(
            text: "Rp${formatCurrency(8996325862385623356)}",
            fontWeight: FontWeight.bold,
            color: AppColor.white,
            fontSize: CSize.m,
          ),
          VertGap.reg,
          Text(
            "Bulan ini",
            style: textTheme.titleMedium?.copyWith(
              color: AppColor.white.withOpacity(.8),
            ),
          ),
          VertGap.s,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: AppColor.white.withOpacity(.25),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_downward_rounded,
                            size: 16,
                            color: AppColor.white,
                          ),
                        ),
                        HorzGap.s,
                        Text(
                          "Pemasukan",
                          style: textTheme.titleMedium
                              ?.copyWith(color: AppColor.white.withOpacity(.8)),
                        ),
                      ],
                    ),
                    VertGap.xs,
                    BoldText(
                      text: "Rp${formatCurrency(12831283681263)}",
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColor.white,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: AppColor.white.withOpacity(.25),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_upward_rounded,
                            size: 16,
                            color: AppColor.white,
                          ),
                        ),
                        HorzGap.s,
                        Text(
                          "Pengeluaran",
                          style: textTheme.titleMedium
                              ?.copyWith(color: AppColor.white.withOpacity(.8)),
                        ),
                      ],
                    ),
                    VertGap.xs,
                    BoldText(
                      text: "Rp${formatCurrency(24001231230)}",
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColor.white,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
