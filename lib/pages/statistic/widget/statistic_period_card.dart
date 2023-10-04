import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_size.dart';

class StatisticPeriodCard extends StatelessWidget {
  const StatisticPeriodCard({
    super.key,
    required this.period,
    required this.title,
    required this.onPeriodChange,
  });

  final String title;
  final String period;
  final Function(String) onPeriodChange;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPeriodChange(title),
      child: Container(
        decoration: BoxDecoration(
          color: period == title ? AppColor.primaryLight : AppColor.white,
          borderRadius: const BorderRadius.all(Radius.circular(CSize.s)),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: CSize.m,
          vertical: CSize.s,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: period == title ? AppColor.white : AppColor.grey,
          ),
        ),
      ),
    );
  }
}
