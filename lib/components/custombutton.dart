
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool showIcon;
  final IconData icon;
  final double width;
  final double height;
  const CustomButton(
      {super.key,
        required this.title,
        required this.showIcon,
        required this.icon,
        required this.width,
        required this.height
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {},
        iconAlignment: IconAlignment.start,
        style: ElevatedButton.styleFrom(
        minimumSize: Size(width * 0.0001, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: const BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
        label: Text(
          title,
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
        ),
        icon: Visibility(
          visible: showIcon,
          child: Icon(
            icon,
            color: Colors.blue,
          ),
        ));
  }
}