import 'package:get/state_manager.dart';

import '../../../models/model_user.dart';
import '../../../services/sql/data/user/get_user.dart';
import '../../../utils/get_user_id.dart';

class ProfileController extends GetxController {
  final Rx<User?> user = Rx<User?>(null);

  Future<void> getDataUser() async {
    final userId = int.parse(await getUserId());
    final response = await getUser(userId);
    if (response.data != null) {
      user.value = response.data;
    }
  }
}
