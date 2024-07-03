import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskit/constants/appconstants.dart';

class TextView extends StatefulWidget {
  final double? fontSize;
  final Color? color;
  final String? title;
  final FontWeight? fontWeight;
  final bool? isChecked;
  const TextView(
      {super.key, this.fontSize, this.color, this.title, this.fontWeight, this.isChecked});

  @override
  State<TextView> createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  @override
  Widget build(BuildContext context) {

    return Text(widget.title ?? "",
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        maxLines: 5,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
              decoration: widget.isChecked?? false ? TextDecoration.lineThrough : null,
                color: widget.color, fontSize: widget.fontSize, fontWeight: widget.fontWeight)));
  }
}
