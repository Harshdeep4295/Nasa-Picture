import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Text textField(
    String text,
    double? fontSize, {
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: fontSize ?? 18,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: 1,
        wordSpacing: 1.5,
        height: 1.2,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
