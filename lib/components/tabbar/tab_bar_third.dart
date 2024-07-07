import 'package:flutter/material.dart';
import '../../constants/appconstants.dart';
import '../cards/text_view.dart';

class FilesPage extends StatelessWidget {
  final double width;
  const FilesPage({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TabBarFileItem(
          text: 'Drafts.pdf',
          width: width,
        ),
        TabBarFileItem(
          text: 'IconDesigns.psd',
          width: width,
        ),
        TabBarFileItem(
          text: 'Logo.png',
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

class TabBarFileItem extends StatefulWidget {
  final String text;
  final double width;
  const TabBarFileItem({super.key, required this.text, required this.width});

  @override
  State<TabBarFileItem> createState() => _TabBarFileItemState();
}

class _TabBarFileItemState extends State<TabBarFileItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final boxWidth = (widget.width - 40) * 0.7;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: widget.width,
        height: 60,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: AppThemeColors.highLight.withOpacity(0.1)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.file_present_rounded,
              size: 26,
              color: AppThemeColors.highLight.withOpacity(0.5),
            ),
            const SizedBox(
              width: 20,
            ),
            ConstrainedBox(
                constraints: BoxConstraints(maxWidth: boxWidth * 0.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextView(
                      title: widget.text,
                      fontSize: 14,
                      color: AppThemeColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      isChecked: isChecked,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
