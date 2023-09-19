import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_gap.dart';
import '../../constants/custom_size.dart';
import '../state/button_state.dart';
import 'bold_text.dart';

enum ButtonType {
  elevated,
  outlined,
  text,
}

class CButton extends StatelessWidget {
  const CButton({
    super.key,
    required this.type,
    required this.text,
    this.fontSize,
    this.backgroundColor = AppColor.primaryLight,
    this.borderColor = AppColor.primaryLight,
    this.foregroundColor = AppColor.black,
    this.shadowColor = AppColor.primaryLight,
    required this.onPressed,
    this.state = ButtonState.enable,
    this.suffix,
    this.prefix,
    this.padding,
    this.textColor,
    this.radius,
    this.borderWidth,
    this.elevation = 10,
  });

  final ButtonType type;
  final void Function()? onPressed;
  final ButtonState state;
  final String text;
  final double? fontSize;
  final Color? textColor;
  final Widget? suffix;
  final Widget? prefix;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final Color shadowColor;
  final double? borderWidth;
  final double elevation;
  final EdgeInsets? padding;
  final BorderRadiusGeometry? radius;

  @override
  Widget build(BuildContext context) {
    return _buildButton();
  }

  Widget _buildButton() {
    switch (type) {
      case ButtonType.elevated:
        return buildElevatedButton();
      case ButtonType.outlined:
        return buildOutlinedButton();
      case ButtonType.text:
        return buildTextButton();
    }
  }

  TextButton buildTextButton() {
    return TextButton(
      onPressed: state == ButtonState.enable ? onPressed : null,
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: Colors.transparent,
        disabledForegroundColor: foregroundColor.withOpacity(.5),
        disabledBackgroundColor: backgroundColor.withOpacity(.5),
        elevation: elevation,
        shadowColor: shadowColor,
        padding: const EdgeInsets.symmetric(
          horizontal: CSize.reg,
          vertical: CSize.s,
        ),
        minimumSize: Size.zero,
      ),
      child: buildChild(),
    );
  }

  OutlinedButton buildOutlinedButton() {
    return OutlinedButton(
      onPressed: state == ButtonState.enable ? onPressed : null,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: state == ButtonState.enable
              ? borderColor
              : borderColor.withOpacity(.5),
          width: borderWidth ?? 1.0,
        ),
        foregroundColor: foregroundColor,
        backgroundColor: Colors.transparent,
        disabledForegroundColor: foregroundColor.withOpacity(.5),
        disabledBackgroundColor: Colors.transparent,
        elevation: elevation,
        shadowColor: shadowColor,
        padding: const EdgeInsets.symmetric(
          horizontal: CSize.reg,
          vertical: CSize.s,
        ),
        minimumSize: Size.zero,
      ),
      child: buildChild(),
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      onPressed: state == ButtonState.enable ? onPressed : null,
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        disabledForegroundColor: foregroundColor.withOpacity(.5),
        disabledBackgroundColor: backgroundColor.withOpacity(.5),
        elevation: elevation,
        shadowColor: shadowColor,
        padding: const EdgeInsets.symmetric(
          horizontal: CSize.reg,
          vertical: CSize.s,
        ),
        minimumSize: Size.zero,
      ),
      child: buildChild(),
    );
  }

  Widget buildChild() {
    if (state == ButtonState.loading) {
      return Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: CSize.s),
        child: SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(
            color: state == ButtonState.enable
                ? foregroundColor
                : foregroundColor.withOpacity(.5),
            strokeWidth: 2.0,
          ),
        ),
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefix != null) ...[prefix ?? const SizedBox(), HorzGap.s],
          Flexible(
            child: BoldText(
              text: text,
              fontWeight: FontWeight.w600,
              fontSize: fontSize ?? CSize.reg,
              color: textColor,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (suffix != null) ...[HorzGap.s, suffix ?? const SizedBox()]
        ],
      );
    }
  }
}
