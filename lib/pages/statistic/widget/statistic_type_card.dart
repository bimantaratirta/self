import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_size.dart';

class StatisticTypeCard extends StatelessWidget {
  const StatisticTypeCard({
    super.key,
    required this.type,
    required this.title,
    required this.onTypeChange,
  });

  final String type;
  final String title;
  final Function(String) onTypeChange;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onTypeChange(title),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(CSize.s),
          decoration: BoxDecoration(
            color: type == title ? AppColor.primaryLight : AppColor.lightGrey,
            borderRadius: const BorderRadius.all(Radius.circular(CSize.s)),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: type == title ? AppColor.white : AppColor.black,
            ),
          ),
        ),
      ),
    );
  }
}
