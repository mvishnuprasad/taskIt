

import 'package:flutter/material.dart';
import '../../constants/appconstants.dart';
import '../textviews/text_view.dart';

class NotesPage extends StatelessWidget {
  final double width;
  const NotesPage({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TabBarNoteItem(
          text: 'Select the Design Template',
          width: width,
        ),
        TabBarNoteItem(
          text: 'Gather Stock Images for design',
          width: width,
        ),
        TabBarNoteItem(
          text: 'Prepare draft wireframes for sidebar widget',
          width: width,
        ),
        const SizedBox(
          height: 100,
        ),
        FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: AppThemeColors.highLight,
          foregroundColor: AppThemeColors.background,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            size: 28,
          ),
        ),
      ],
    );
  }
}

class TabBarNoteItem extends StatefulWidget {
  final String text;
  final double width;
  const TabBarNoteItem({super.key, required this.text, required this.width});

  @override
  State<TabBarNoteItem> createState() => _TabBarNoteItemState();
}

class _TabBarNoteItemState extends State<TabBarNoteItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final boxWidth = (widget.width - 40) * 0.7;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
              side: BorderSide(
                width: 0,
                color: AppThemeColors.highLight.withOpacity(0.5),
              ),
              fillColor: WidgetStateProperty.all<Color>(
                  AppThemeColors.highLight.withOpacity(0.5)),
              checkColor: AppThemeColors.primaryColor,
              value: isChecked,
              onChanged: (check) {
                setState(() {
                  isChecked = check!;
                });
              }),
          const SizedBox(
            width: 20,
          ),
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: boxWidth * 0.8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    title: widget.text,
                    fontSize: 14,
                    color: AppThemeColors.primaryColor,
                    fontWeight: FontWeight.w600,
                    isChecked: isChecked,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: boxWidth * 0.8,
                    child: Divider(
                      height: 2,
                      color: AppThemeColors.primaryColor.withOpacity(0.2),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
