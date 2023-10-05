import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:path_provider/path_provider.dart';

import '../../../constants/app_routes.dart';
import '../../../services/sql/sql_service.dart';
import '../../../services/xml/xml_service.dart';
import '../../../shareds/state/button_state.dart';
import '../../../utils/permission_manager.dart';
import '../widget/regist_image_dialog.dart';

class RegistController extends GetxController {
  Rx<ButtonState> buttonState = ButtonState.disable.obs;
  Rx<String?> image = Rx<String?>(null);
  Rx<String?> name = Rx<String?>(null);

  Future<void> pickImage() async {
    PermissionManager.checkStoragePermission(() async {
      final path = await FilePicker.platform.pickFiles(allowMultiple: false);
      if (path != null) {
        image.value = path.files.single.path!;
        if (name.value != null) buttonState.value = ButtonState.enable;
      }
    });
  }

  void onChangePicture() async {
    if (image.value == null) {
      await pickImage();
    } else {
      Get.dialog(const RegistImageDialog());
    }
  }

  void onNameChanged(String text) async {
    name.value = text;
    if (image.value != null) buttonState.value = ButtonState.enable;
  }

  void onNext() async {
    buttonState.value = ButtonState.loading;
    final savedImage = await saveImage();
    await FilePicker.platform.clearTemporaryFiles();
    final Map<String, Object> value = {
      "name": name.value!,
      "image": savedImage.path,
      "balance": 0.0,
    };
    final response = await sqlService.insert(SQLParam(
      table: SQLTable.user,
      fromJson: (_) {},
      value: value,
    ));
    final prefs = {"user_id": response.data, "is_registered": true};
    XMLService.writePrefs(prefs);
    buttonState.value = ButtonState.enable;
    Get.offAllNamed(AppRoute.navigation, arguments: response.data);
  }

  Future<File> saveImage() async {
    final fileName = image.value!.split("/").last;
    final newDir = await getApplicationDocumentsDirectory();
    final newPath = "${newDir.path}/$fileName";
    final savedImage = File(newPath);
    return savedImage.existsSync()
        ? savedImage
        : (await File(image.value!).copy(newPath));
  }
}
