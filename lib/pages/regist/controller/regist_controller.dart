import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';

import '../../../services/sql_service.dart';
import '../../../shareds/state/button_state.dart';
import '../widget/regist_image_dialog.dart';

class RegistController extends GetxController {
  Rx<ButtonState> buttonState = ButtonState.disable.obs;
  Rx<String?> image = Rx<String?>(null);
  Rx<String?> name = Rx<String?>(null);

  Future<void> pickImage() async {
    final path = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (path != null) {
      image.value = path.files.single.path!;
      if (name.value != null) buttonState.value = ButtonState.enable;
    }
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
    final Map<String, Object> value = {
      "name": name.value!,
      "image": image.value!,
    };
    final id = await sqlService.insert<int>(SQLParam(
      table: SQLTables.user,
      value: value,
      fromJson: (List<Map<String, Object?>> _) {},
    ));

    log(id.toString());
  }

  void saveImage() {
    // File file = File
  }
}
