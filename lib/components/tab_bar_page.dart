import 'package:flutter/material.dart';
import 'package:taskit/components/custom_text.dart';
import 'package:taskit/constants/appconstants.dart';
class DetailsTabBar extends StatelessWidget {
  const DetailsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TabBarItem(icon: Icons.calendar_month, text: '10:30 - 11:30',),
        TabBarItem(icon: Icons.my_location_outlined, text: 'zoom.org/xar-eee-ee',),
        TabBarItem(icon: Icons.message, text: 'Prepare the notes',),
        TabBarItem(icon: Icons.person_rounded, text: 'Prepare the notes',),
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
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right:20.0,bottom: 20.0,top: 20),
          child: Icon(icon,size: 26,color: AppThemeColors.primaryColor.withOpacity(0.5),),
        ),
         TextView(fontSize: 14, title: text)
      ],
    );
  }
}
