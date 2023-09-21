import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CDivider extends StatelessWidget {
  const CDivider({super.key, required this.height, required this.thickness});

  final double height;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: AppColor.lightGrey,
      thickness: thickness,
    );
  }
}
