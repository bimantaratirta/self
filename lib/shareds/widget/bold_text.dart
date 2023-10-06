import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoldText extends StatelessWidget {
  const BoldText({
    super.key,
    required this.text,
    this.fontSize,
    required this.fontWeight,
    this.color,
    this.overflow,
    this.height,
    this.softWrap,
    this.textAlign,
  });

  final String text;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextOverflow? overflow;
  final double? height;
  final bool? softWrap;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: GoogleFonts.ibmPlexSans(fontWeight: fontWeight).fontFamily,
        overflow: overflow,
        height: height,
      ),
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }
}
