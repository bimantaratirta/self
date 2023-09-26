import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_size.dart';

class CTextField extends StatelessWidget {
  const CTextField({
    super.key,
    required this.onChanged,
    this.onTapOutside,
    required this.controller,
    required this.focusNode,
    this.isObscure,
    required this.enabled,
    required this.hintText,
    this.labelWeight,
    this.labelColor,
    this.labelSize,
    this.suffix,
    this.keryboardType,
    this.hintStyle,
  });

  final Function(String) onChanged;
  final Function(PointerDownEvent)? onTapOutside;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool? isObscure;
  final bool enabled;
  final String hintText;
  final TextStyle? hintStyle;
  final FontWeight? labelWeight;
  final Color? labelColor;
  final double? labelSize;
  final Widget? suffix;
  final TextInputType? keryboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      enabled: enabled,
      onTapOutside: onTapOutside,
      obscureText: isObscure ?? false,
      keyboardType: keryboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.lightGrey),
          borderRadius: BorderRadius.all(Radius.circular(CSize.s)),
        ),
        isCollapsed: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        hintText: hintText,
        hintStyle:
            hintStyle ?? const TextStyle(color: AppColor.grey, fontSize: 14),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.lightGrey),
          borderRadius: BorderRadius.all(Radius.circular(CSize.s)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.lightGrey),
          borderRadius: BorderRadius.all(Radius.circular(CSize.s)),
        ),
        suffixIcon: suffix,
        suffixIconConstraints: const BoxConstraints(minWidth: 50),
      ),
    );
  }
}
