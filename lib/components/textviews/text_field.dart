import 'package:flutter/material.dart';
import 'package:taskit/components/textviews/text_view.dart';

import '../../constants/appconstants.dart';

class TextFieldView extends StatelessWidget {
  final String hintText;
  final String title;
  IconData? suffixIcon;
  TextFieldView(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        //setState(() {
        selectedDate = picked;
        debugPrint("ioiijoij$selectedDate");
        //});
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          title: title,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppThemeColors.primaryColor,
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          //controller: _textController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          autofocus: true,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              child: Icon(suffixIcon),
              onTap: () => selectDate(context),
            ),
            hintText: hintText,
            alignLabelWithHint: true,
            hintStyle: TextStyle(color: AppThemeColors.primaryColor),
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
              borderSide: const BorderSide(
                  color: Colors.red, width: 2.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                  color: Colors.red, width: 2.0),
            ),
          ),
        )
      ],
    );
  }
}
