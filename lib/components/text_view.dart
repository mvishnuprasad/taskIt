import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskit/constants/appconstants.dart';

class TextView extends StatelessWidget {
  final double? fontSize;
  final Color? color;
  final String? title;
  final FontWeight? fontWeight;
  const TextView(
      {super.key, this.fontSize, this.color, this.title, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(title ?? "",
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: color, fontSize: fontSize, fontWeight: fontWeight)));
  }
}
