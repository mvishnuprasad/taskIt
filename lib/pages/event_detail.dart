import 'package:flutter/material.dart';
import 'package:taskit/components/text_view.dart';
import 'package:taskit/components/tab_bar_first.dart';
import '../components/date_text.dart';
import '../constants/appconstants.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Container(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.keyboard_arrow_down,
              color: AppThemeColors.primaryColor,
              size: 32,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: (width - 40) * 0.7),
                  child: TextView(
                    fontSize: 28,
                    color: AppThemeColors.primaryColor,
                    title: "Event: UI Redesign",
                    fontWeight: FontWeight.w600,
                  )),
              const TodayDate(),
            ]),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: (width - 40),
              decoration: BoxDecoration(
                  color: AppThemeColors.highLight.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: TabBar(
                dividerHeight: 0,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AppThemeColors.background,
                unselectedLabelColor: AppThemeColors.primaryColor,
                indicator: BoxDecoration(
                    color: AppThemeColors.highLight,
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                tabs: const [
                  Tab(
                      icon: TextView(
                    fontSize: 13,
                    title: "Details",
                    fontWeight: FontWeight.w600,
                  )),
                  Tab(
                      icon: TextView(
                    fontSize: 13,
                    title: "Files",
                    fontWeight: FontWeight.w600,
                  )),
                  Tab(
                      icon: TextView(
                    fontSize: 13,
                    title: "Notes",
                    fontWeight: FontWeight.w600,
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
                height: height * 0.5,
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: const TabBarView(
                  children: [DetailsTabBar(), Text("print('');"), Text("sss")],
                ))
          ],
        ),
      ),
    );
  }
}
