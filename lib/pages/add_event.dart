import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/components/cards/text_field.dart';
import 'package:taskit/models/eventmodel.dart';
import 'package:taskit/providers/dataproviders.dart';
import '../components/persistance/hive.dart';
import '../components/cards/text_view.dart';
import '../constants/appconstants.dart';

class AddEvent extends ConsumerWidget {
  final String eventTitle;

  const AddEvent({super.key, required this.eventTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventData = ref.read(eventProvider);
    final width = MediaQuery.sizeOf(context).width;
    final formKey = GlobalKey<FormState>();
    //final height = MediaQuery.sizeOf(context).height;
    TextEditingController eventNameController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController startTimeController = TextEditingController();
    TextEditingController endTimeController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Container(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        decoration: BoxDecoration(
            color: AppThemeColors.background,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.keyboard_arrow_down,
                color: AppThemeColors.primaryColor,
                size: 32,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: (width - 40) * 0.7),
                      child: TextView(
                        fontSize: 28,
                        color: AppThemeColors.primaryColor,
                        title: eventTitle,
                        fontWeight: FontWeight.w600,
                      )),
                  Icon(
                    Icons.event_seat_outlined,
                    size: 36,
                    color: AppThemeColors.highLight,
                  )
                ]),
            const SizedBox(
              height: 20,
            ),
            TextFieldView(
              hintText: "Enter the name of the event.",
              title: 'Event Name',
              controller: eventNameController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldView(
              hintText: "Select Date",
              suffixIcon: Icons.date_range,
              title: 'Date',
              controller: dateController,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: width * 0.5 - 30,
                    child: TextFieldView(
                      hintText: "Start TIme",
                      suffixIcon: Icons.date_range,
                      title: 'Start Time',
                      controller: startTimeController,
                    )),
                SizedBox(
                    width: width * 0.5 - 30,
                    child: TextFieldView(
                      hintText: "End Time",
                      suffixIcon: Icons.access_time_outlined,
                      title: 'End Time',
                      controller: endTimeController,
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldView(
              hintText: "Location / URL",
              title: 'Event Location',
              controller: locationController,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  title: "Members",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppThemeColors.primaryColor,
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppThemeColors.highLight.withOpacity(0.3)),
                  child: Icon(
                    Icons.add,
                    color: AppThemeColors.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color?>(
                        AppThemeColors.highLight.withOpacity(0.4)),
                    shadowColor: WidgetStateProperty.all<Color?>(
                        AppThemeColors.highLight.withOpacity(0.1)),
                  ),
                  onPressed: () {
                    //CalendarControllerProvider.of(context).controller.add(newEvent);
                    if (formKey.currentState!.validate()) {
                      eventData.add(EventModel(
                          title: eventNameController.text,
                          date: dateController.text,
                          startTime: startTimeController.text,
                          location: locationController.text,
                          endTime: endTimeController.text));
                      debugPrint("${eventData.toList().length}");

                      HiveMethods().saveToHive(EventModel(
                          title: eventNameController.text,
                          date: dateController.text,
                          startTime: startTimeController.value.text,
                          location: locationController.text,
                          endTime: endTimeController.value.text));
                      myBool.value = !myBool.value;
                      Navigator.pop(context);
                    }

                  },
                  child: TextView(
                    title: "Submit",
                    fontWeight: FontWeight.bold,
                    color: AppThemeColors.primaryColor,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
