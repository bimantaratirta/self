import 'package:flutter/material.dart';

import '../../constants/custom_size.dart';

class DefaultBackground extends StatelessWidget {
  const DefaultBackground({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: CSize.m),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: padding,
      constraints: const BoxConstraints(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage('assets/background/scaffold-bg.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: child,
    );
  }
}
