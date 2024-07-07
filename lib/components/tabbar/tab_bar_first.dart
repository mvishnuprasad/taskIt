import 'package:flutter/material.dart';
import 'package:taskit/constants/appconstants.dart';

import '../textviews/text_view.dart';

class DetailsTabBar extends StatelessWidget {
  final double width;
  final String time;
  final String location;
  const DetailsTabBar({super.key, required this.width, required this.time, required this.location});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        TabBarItem(
          icon: Icons.calendar_month,
          text: time,
          width: width,
        ),
        TabBarItem(
          icon: Icons.my_location_outlined,
          text: location
          ,
          width: width,
        ),
        TabBarItem(
          icon: Icons.message,
          text:
              'Prepare the notes in PDF, ReFactor Figma constants, Cancel Launch page animation',
          width: width,
        ),
        TabBarItem(
          icon: Icons.person_rounded,
          text: 'Joseph , Peter , Rebecca',
          width: width,
        ),
      ],
    );
  }
}

class TabBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final double width;
  const TabBarItem(
      {super.key, required this.icon, required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    final boxWidth = (width - 40) * 0.7;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 26,
            color: AppThemeColors.highLight.withOpacity(0.5),
          ),
          const SizedBox(
            width: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: boxWidth * 0.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  title: text,
                  fontSize: 14,
                  color: AppThemeColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: boxWidth,
                  child: Divider(
                    height: 2,
                    color: AppThemeColors.primaryColor.withOpacity(0.2),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
