import 'package:flutter/material.dart';

import '../../constants/custom_size.dart';

class DefaultBackground extends StatelessWidget {
  const DefaultBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.symmetric(horizontal: CSize.m),
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
