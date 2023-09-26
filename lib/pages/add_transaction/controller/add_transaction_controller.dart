import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../../../shareds/state/button_state.dart';
import '../../../utils/permission_manager.dart';

class AddTransactionController extends GetxController {
  Rx<ButtonState> buttonState = ButtonState.disable.obs;

  Rx<String> type = "pengeluaran".obs;
  Rx<String?> image = Rx<String?>(null);
  Rx<String?> date = Rx<String?>(null);
  Rx<String?> time = Rx<String?>(null);
  final nameC = TextEditingController();
  final amountC = TextEditingController();
  final feeC = TextEditingController();

  final nameFN = FocusNode();
  final amountFN = FocusNode();
  final feeFN = FocusNode();

  void onChangePicture() async {
    await pickImage();
    if (image.value == null) {
    } else {
      // Get.dialog(const RegistImageDialog());
    }
  }

  Future<void> pickImage() async {
    PermissionManager.checkStoragePermission(() async {
      final path = await FilePicker.platform.pickFiles(allowMultiple: false);
      if (path != null) {
        image.value = path.files.single.path!;
        // if (name.value != null) buttonState.value = ButtonState.enable;
      }
    });
  }

  void setType(String type) {
    this.type.value = type;
  }

  void onSave() {
    Get.back();
  }
}
