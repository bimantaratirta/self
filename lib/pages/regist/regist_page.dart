import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_gap.dart';
import '../../constants/custom_size.dart';
import '../../shareds/widget/custom_button.dart';
import '../../shareds/widget/custom_text_field.dart';
import 'controller/regist_controller.dart';

class RegistPage extends StatefulWidget {
  const RegistPage({super.key});

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  final controller = Get.put<RegistController>(RegistController());

  final _nameController = TextEditingController();
  final _nameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(CSize.m),
        constraints: const BoxConstraints(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('assets/background/scaffold-bg.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: size.width,
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.all(CSize.reg),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(CSize.reg),
                ),
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.black.withOpacity(.25),
                    offset: const Offset(1.0, 5.0),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Masukan foto kamu disini"),
                      VertGap.s,
                      GestureDetector(
                        onTap: controller.onChangePicture,
                        child: Obx(() {
                          final image = controller.image.value;
                          return Container(
                            width: 75,
                            height: 75,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.lightGrey,
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: image == null
                                ? const Icon(
                                    Icons.camera_alt_rounded,
                                    color: AppColor.white,
                                    size: 32,
                                  )
                                : Image.file(
                                    File(image),
                                    fit: BoxFit.cover,
                                  ),
                          );
                        }),
                      ),
                      VertGap.reg,
                      const Text("Kamu mau dipanggil apa?"),
                      VertGap.s,
                      CTextField(
                        onChanged: controller.onNameChanged,
                        onTapOutside: (_) => _nameFocusNode.unfocus(),
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                        enabled: true,
                        hintText: "Masukan nama kamu",
                      ),
                    ],
                  ),
                  VertGap.s,
                  Obx(() {
                    final state = controller.buttonState.value;
                    return CButton(
                      state: state,
                      type: ButtonType.elevated,
                      foregroundColor: AppColor.white,
                      elevation: 2.5,
                      text: "Lanjut",
                      onPressed: controller.onNext,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
