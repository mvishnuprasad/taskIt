import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskit/components/textviews/text_view.dart';
import 'package:taskit/constants/appconstants.dart';
import 'package:taskit/providers/dataproviders.dart';

class TodayDate extends ConsumerWidget {
  const TodayDate({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var date = ref.watch(dateProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextView(
          title: "${date.day}",
          fontSize: 42,
          color: AppThemeColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextView(
              title: DateFormat('EEE').format(date).toUpperCase(),
              fontSize: 14,
              color: AppThemeColors.highLight,
              fontWeight: FontWeight.bold,
            ),
            TextView(
              title: DateFormat('MMM').format(date).toUpperCase(),
              fontSize: 14,
              color: AppThemeColors.shadow,
              fontWeight: FontWeight.bold,
            ),
          ],
        )
      ],
    );
  }
}
