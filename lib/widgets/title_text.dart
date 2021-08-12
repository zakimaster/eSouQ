import 'package:esouq/Tools/light_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const TitleText(
      {
      required this.text,
      this.fontSize = 18,
      this.color = LightColor.titleTextColor,
      this.fontWeight = FontWeight.w800
      })
      : super();
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.amita(
            fontSize: fontSize, fontWeight: fontWeight, color: color));
  }
}