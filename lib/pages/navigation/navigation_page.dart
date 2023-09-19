import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import 'controller/navigation_controller.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final userId = Get.arguments;
  final controller = Get.put<NavigationController>(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('NAVIGATION $userId'),
      ),
    );
  }
}
