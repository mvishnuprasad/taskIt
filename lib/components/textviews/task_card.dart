import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/dictionaries/dictionary.dart';
import 'package:taskit/components/textviews/text_view.dart';

import '../../constants/appconstants.dart';

class TaskCard extends StatelessWidget {
  final double width;
  final double height;
  final String task;
  final int number;
  const TaskCard({super.key, required this.width, required this.task, required this.height, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width*0.40,
      height: height*0.15,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppThemeColors.background,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: AppThemeColors.shadow.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 1))
          ],
        ),
        child:  Column(
          children: [
            TextView(
              title: "You have",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppThemeColors.primaryColor,
            ),
            TextView(
              title: "$number",
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppThemeColors.highLight,
            ),
            TextView(
              title: "$task for the Day",
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppThemeColors.primaryColor
            ),
          ],
        ));
  }
}
