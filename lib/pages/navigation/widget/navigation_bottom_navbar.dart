import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../controller/navigation_controller.dart';

class NavigationBottomNavbar extends StatelessWidget {
  const NavigationBottomNavbar({
    super.key,
    required NavigationController controller,
    required this.idx,
  }) : _controller = controller;

  final NavigationController _controller;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _controller.onChangeIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.primaryLight,
        unselectedItemColor: AppColor.grey,
        items: [
          BottomNavigationBarItem(
            label: 'home',
            icon: Image.asset(
              'assets/icons/${idx == 0 ? "home-fill" : "home"}.png',
              width: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: 'chart',
            icon: Image.asset(
              'assets/icons/${idx == 1 ? "chart-fill" : "chart"}.png',
              width: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: 'wallet',
            icon: Image.asset(
              'assets/icons/${idx == 2 ? "wallet-fill" : "wallet"}.png',
              width: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: 'profile',
            icon: Image.asset(
              'assets/icons/${idx == 3 ? "person-fill" : "person"}.png',
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
