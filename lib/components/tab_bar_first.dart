import 'package:flutter/material.dart';
import 'package:taskit/constants/appconstants.dart';

import 'text_view.dart';

class DetailsTabBar extends StatelessWidget {
  const DetailsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        TabBarItem(
          icon: Icons.calendar_month,
          text: '10:30 - 11:30',
        ),
        TabBarItem(
          icon: Icons.my_location_outlined,
          text: 'zoom.org/xar-eee-ee',
        ),
        TabBarItem(
          icon: Icons.message,
          text:
              'Prepare the notes in PDF, ReFactor Figma constants, Cancel Launch page animation',
        ),
        TabBarItem(
          icon: Icons.person_rounded,
          text: 'Joseph , Peter , Rebecca',
        ),
      ],
    );
  }
}

class TabBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const TabBarItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
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
              constraints: const BoxConstraints(maxWidth: 200),
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
                  Divider(
                    height: 2,
                    color: AppThemeColors.primaryColor.withOpacity(0.2),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
