import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class NavigationFAB extends StatelessWidget {
  const NavigationFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {},
      child: const Icon(
        Icons.add_rounded,
        color: AppColor.white,
        size: 32,
      ),
    );
  }
}
