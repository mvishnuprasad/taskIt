import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:taskit/constants/appconstants.dart';

class TodayDate extends StatelessWidget {
  const TodayDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${DateTime.now().day}",
          style: GoogleFonts.poppins(
              textStyle:  TextStyle(
                  color: AppThemeColors.primaryColor,
                  fontSize: 42,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              DateFormat('EEE').format(DateTime.now()).toUpperCase(),
              style: GoogleFonts.poppins(
                  textStyle:  TextStyle(
                      color: AppThemeColors.highLight,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
            Text(
              DateFormat('MMM').format(DateTime.now()).toUpperCase(),
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        )
      ],
    );
  }
}
