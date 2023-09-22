import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_routes.dart';

class NavigationFAB extends StatelessWidget {
  const NavigationFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {
        Get.toNamed(AppRoute.addTransaction);
      },
      child: const Icon(
        Icons.add_rounded,
        color: AppColor.white,
        size: 32,
      ),
    );
  }
}
