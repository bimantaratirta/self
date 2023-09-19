import 'package:get/route_manager.dart';

import '../pages/landing/landing_page.dart';
import '../pages/navigation/navigation_page.dart';
import '../pages/regist/regist_page.dart';
import '../pages/splash/splash_page.dart';
import '../shareds/page/storage_permission/storage_permission_page.dart';

class AppRoute {
  static List<GetPage> pages = <GetPage>[
    GetPage(
      name: splash,
      page: () => const SplashPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: landing,
      page: () => const LandingPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: regist,
      page: () => const RegistPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: storagePermission,
      page: () => StoragePermissionPage(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: navigation,
      page: () => const NavigationPage(),
      transition: Transition.rightToLeft,
    )
  ];

  static String splash = "/splash";
  static String landing = "/landing";
  static String regist = "/regist";
  static String storagePermission = "/storage-permission";
  static String navigation = "/navigation";
}
