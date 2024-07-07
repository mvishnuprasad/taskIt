import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskit/components/cards/text_view.dart';

import '../../constants/appconstants.dart';

class TextFieldView extends StatefulWidget {
  final String hintText;
  final String title;
  final TextEditingController controller;
  IconData? suffixIcon;

  TextFieldView(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      required this.title,
      required this.controller});

  @override
  State<TextFieldView> createState() => _TextFieldViewState();
}

class _TextFieldViewState extends State<TextFieldView> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();
    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          widget.controller.text =
              DateFormat('yyyy-MM-dd').format(selectedDate);
        });
      }
    }

    Future<void> selectTime(BuildContext context) async {
      final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: selectedTime,
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child!);
          });

      if (pickedTime != null && pickedTime != selectedTime) {
        setState(() {
          selectedTime = pickedTime;
          String formattedTime =
              '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}';
          widget.controller.text = formattedTime;
        });
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          title: widget.title,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppThemeColors.primaryColor,
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: widget.controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          autofocus: true,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
                child: Icon(widget.suffixIcon),
                onTap: () async {
                  if (widget.title == "Date") {
                    await selectDate(context);
                  } else if (widget.title == "Start Time" ||
                      widget.title == "End Time") {
                    await selectTime(context);
                  }
                }),
            hintText: widget.hintText,
            alignLabelWithHint: true,
            hintStyle: TextStyle(color: AppThemeColors.primaryColor),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                  color: AppThemeColors.highLight.withOpacity(0.3), width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                  color: AppThemeColors.highLight.withOpacity(0.3), width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                  color: AppThemeColors.highLight.withOpacity(0.9), width: 2.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
            ),
          ),
        )
      ],
    );
  }
}
