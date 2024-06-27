import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  const RoundButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(1, 60),
          shape: const CircleBorder(
            side: BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
        label: Icon(
          icon,
          color: Colors.red,
        ));
  }
}
