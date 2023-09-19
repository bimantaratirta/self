import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../state/button_state.dart';

class StoragePermissionController {
  Rx<ButtonState> buttonState = ButtonState.enable.obs;

  void requestPermission(Function onPermited) async {
    final deviceInfo = DeviceInfoPlugin();
    buttonState.value = ButtonState.loading;
    if ((await deviceInfo.androidInfo).version.sdkInt < 33) {
      Permission.storage.request().then((status) {
        if (status == PermissionStatus.granted) {
          Get.back();
          onPermited();
        }
        log(status.toString());
      });
    } else {
      onPermited();
    }
    buttonState.value = ButtonState.enable;
  }
}
