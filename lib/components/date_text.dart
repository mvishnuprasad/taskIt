import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskit/components/text_view.dart';
import 'package:taskit/constants/appconstants.dart';

class TodayDate extends StatelessWidget {
  const TodayDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextView(
          title: "${DateTime.now().day}",
          fontSize: 42,
          color: AppThemeColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextView(
              title: DateFormat('EEE').format(DateTime.now()).toUpperCase(),
              fontSize: 14,
              color: AppThemeColors.highLight,
              fontWeight: FontWeight.bold,
            ),
            TextView(
              title: DateFormat('MMM').format(DateTime.now()).toUpperCase(),
              fontSize: 14,
              color: AppThemeColors.shadow,
              fontWeight: FontWeight.bold,
            ),
          ],
        )
      ],
    );
  }
}
