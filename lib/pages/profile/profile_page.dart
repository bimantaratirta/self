import 'package:flutter/material.dart';
import 'package:self/shareds/widget/bold_text.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_gap.dart';
import '../../constants/custom_size.dart';
import '../../shareds/widget/default_background.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBackground(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
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
              child: Image.asset("assets/icons/person.png"),
            ),
            VertGap.reg,
            const BoldText(
              text: 'Luthfi Sangar',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black,
            ),
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
