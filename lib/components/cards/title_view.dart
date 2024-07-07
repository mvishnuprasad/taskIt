import 'package:flutter/material.dart';
import 'package:taskit/components/cards/text_view.dart';

import '../../constants/appconstants.dart';

class TitleView extends StatelessWidget {
  final String title;
  final String dateTitle;
  const TitleView({super.key, required this.title, required this.dateTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          title: title,
          fontSize: 36,
          color: AppThemeColors.primaryColor,
          fontWeight: FontWeight.w600,
        ),
        TextView(
          title: dateTitle,
          fontSize: 18,
          color: AppThemeColors.highLight,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
