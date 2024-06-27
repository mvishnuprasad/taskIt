import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kalender/kalender.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskit/pages/calendar_view.dart';

import 'components/roundbutton.dart';
import 'components/titlebar.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: TaskCalendar(),
    );
  }
}
