import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';

import '../../../constants/app_routes.dart';

class SplashController extends GetxController {
  void check() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.toNamed(
      AppRoute.regist,
    );
  }
}
