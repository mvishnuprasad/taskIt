import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskit/constants/appconstants.dart';

class TextView extends StatelessWidget {
  final double fontSize;
  final Color? color;
  final String title;
  const TextView(
      {super.key, required this.fontSize, this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: FontWeight.w600)));
  }
}

class IconsDecorated extends StatelessWidget {
  final IconData icons;
  const IconsDecorated({required this.icons, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppThemeColors.highLight.withOpacity(0.5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icons,
          size: 24.0,
          color: AppThemeColors.background,
        ),
      ),
    );
  }
}
