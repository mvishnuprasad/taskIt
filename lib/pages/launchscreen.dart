import 'package:flutter/material.dart';
import '../constants/appconstants.dart';
import 'home.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LaunchScreen(),
    );
  }
}

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => LaunchScreenState();
}

class LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3000), () async {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const TaskCalendar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppThemeColors.background,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.task_alt,
                size: 32.0,
                color: AppThemeColors.highLight,
              ),
              Text(
                "TaskIt",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppThemeColors.primaryColor.withOpacity(0.6),
                    fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
