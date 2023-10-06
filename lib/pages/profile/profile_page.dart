import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:self/shareds/widget/bold_text.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_gap.dart';
import '../../constants/custom_size.dart';
import '../../shareds/widget/default_background.dart';
import 'controller/profile_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Get.put<ProfileController>(ProfileController());
  @override
  void initState() {
    controller.getDataUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBackground(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(() {
              final user = controller.user.value;
              if (user == null) return const SizedBox();
              return Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.black.withOpacity(.25),
                      offset: const Offset(1.0, 2.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.5,
                    )
                  ],
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.file(
                  File(user.image!),
                  fit: BoxFit.cover,
                ),
              );
            }),
            VertGap.reg,
            Obx(() {
              final user = controller.user.value;
              return BoldText(
                text: user?.name ?? "-",
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.black,
              );
            }),
            VertGap.m,
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CSize.m,
                  vertical: CSize.sr,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/wallet-fill.png",
                      color: AppColor.darkGrey,
                      width: 32,
                      height: 32,
                    ),
                    HorzGap.reg,
                    const BoldText(
                      text: "Account Info",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CSize.m,
                  vertical: CSize.sr,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/wallet-fill.png",
                      color: AppColor.darkGrey,
                      width: 32,
                      height: 32,
                    ),
                    HorzGap.reg,
                    const BoldText(
                      text: "Edit Profil",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CSize.m,
                  vertical: CSize.sr,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/wallet-fill.png",
                      color: AppColor.darkGrey,
                      width: 32,
                      height: 32,
                    ),
                    HorzGap.reg,
                    const BoldText(
                      text: "Pesan Pusat",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CSize.m,
                  vertical: CSize.sr,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/wallet-fill.png",
                      color: AppColor.darkGrey,
                      width: 32,
                      height: 32,
                    ),
                    HorzGap.reg,
                    const BoldText(
                      text: "Keamanan",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CSize.m,
                  vertical: CSize.sr,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/wallet-fill.png",
                      color: AppColor.darkGrey,
                      width: 32,
                      height: 32,
                    ),
                    HorzGap.reg,
                    const BoldText(
                      text: "Hapus Akun",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
