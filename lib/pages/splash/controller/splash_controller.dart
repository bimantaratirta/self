import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';

import '../../../constants/app_routes.dart';
import '../../../services/xml/xml_service.dart';

class SplashController extends GetxController {
  void check() async {
    await Future.delayed(const Duration(seconds: 2));
    final isRegistered = (await XMLService.readPref('is_registered')) as bool?;
    Get.offNamed(
      isRegistered ?? false ? AppRoute.navigation : AppRoute.landing,
    );
  }
}
