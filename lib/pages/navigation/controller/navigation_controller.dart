import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

import '../../index/index_page.dart';
import '../../profile/profile_page.dart';
import '../../statistic/statistic_page.dart';
import '../../wallet/wallet_page.dart';

class NavigationController extends GetxController {
  Rx<int> idx = 0.obs;
  RxList<Widget> pages = <Widget>[
    const IndexPage(),
    const StatisticPage(),
    const WalletPage(),
    const ProfilePage(),
  ].obs;

  void onChangeIndex(int index) {
    idx.value = index;
  }
}
