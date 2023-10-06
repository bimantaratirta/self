// import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:self/models/model_transaction.dart';

import '../../../constants/app_routes.dart';
import '../../../services/sql/data/transaction/post_transaction.dart';
import '../../../shareds/state/button_state.dart';
import '../../../utils/get_user_id.dart';
import '../../../utils/permission_manager.dart';

class AddTransactionController extends GetxController {
  Rx<ButtonState> buttonState = ButtonState.disable.obs;

  Rx<String> type = "pemasukan".obs;
  Rx<String?> image = Rx<String?>(null);
  Rx<String?> date = Rx<String?>(null);
  Rx<String?> time = Rx<String?>(null);
  final nameC = TextEditingController();
  final amountC = TextEditingController();

  final nameFN = FocusNode();
  final amountFN = FocusNode();

  void onChangePicture() async {
    pickImage();
  }

  void pickImage() async {
    PermissionManager.checkStoragePermission(() async {
      final path = await FilePicker.platform.pickFiles(allowMultiple: false);
      if (path != null) {
        image.value = path.files.single.path!;
        stateChecker();
      }
    });
  }

  void setType(String type) {
    this.type.value = type;
    stateChecker();
  }

  void onSave() async {
    final userId = int.parse(await getUserId());
    final transaction = Transaction(
      userId: (userId),
      image: image.value,
      name: nameC.text,
      status: type.value,
      amount: int.parse(amountC.text),
      date: date.value,
    );
    await postTransaction(transaction);
    Get.offAllNamed(AppRoute.navigation);
  }

  void stateChecker() {
    if (image.value != null &&
        nameC.text.isNotEmpty &&
        amountC.text.isNotEmpty &&
        date.value != null) {
      buttonState.value = ButtonState.enable;
    } else {
      buttonState.value = ButtonState.disable;
    }
  }
}
