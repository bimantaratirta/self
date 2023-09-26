import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_size.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      constraints: const BoxConstraints(),
      padding: padding ?? const EdgeInsets.all(CSize.reg),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(CSize.reg),
        ),
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(.25),
            offset: const Offset(1.0, 5.0),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
