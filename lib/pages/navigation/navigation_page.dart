import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import 'widget/navigation_bottom_navbar.dart';
import 'controller/navigation_controller.dart';
import 'widget/navigation_fab.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final _controller = Get.put<NavigationController>(NavigationController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final idx = _controller.idx.value;
      final List<Widget> pages = _controller.pages;
      return Scaffold(
        body: pages.elementAt(idx),
        bottomNavigationBar: NavigationBottomNavbar(
          controller: _controller,
          idx: idx,
        ),
        floatingActionButton: idx == 0 ? const NavigationFAB() : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );
    });
  }
}
