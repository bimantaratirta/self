import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/route_manager.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants/app_routes.dart';

class PermissionManager {
  static void checkStoragePermission(Function onPermited) async {
    final deviceInfo = DeviceInfoPlugin();
    if ((await deviceInfo.androidInfo).version.sdkInt < 33) {
      final isGranted = await Permission.storage.isGranted;
      if (!isGranted) {
        Get.toNamed(AppRoute.storagePermission, arguments: onPermited);
      } else {
        onPermited();
      }
    } else {
      onPermited();
    }
  }
}
