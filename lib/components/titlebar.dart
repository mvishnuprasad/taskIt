import 'package:flutter/material.dart';
import 'package:taskit/components/roundbutton.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custombutton.dart';

class TitleBar extends StatelessWidget {
  final double width;
  final double height;
  TitleBar({super.key, required this.width, required this.height});
  List<String> list = <String>['...', 'One', 'Two', 'Three', 'Four'];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(2, 3))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0, right: 20, left: 10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  color: Colors.blue,
                  size: 28,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Job Scheduler",
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w400)),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.sync,
                  color: Colors.blue,
                  size: 21,
                )
              ],
            ),
            Row(
              children: [
                CustomButton(
                    title: "Requests",
                    showIcon: false,
                    icon: Icons.settings_outlined,
                    width: width,
                    height: height),
                const SizedBox(
                  width: 10,
                ),
                const RoundButton(icon: Icons.info_outline,),
                CustomButton(
                    title: "Jobs",
                    showIcon: true,
                    icon: Icons.settings_outlined,
                    width: width,
                    height: height),
                const SizedBox(
                  width: 10,
                ),
                CustomButton(
                    title: "Settings",
                    showIcon: true,
                    icon: Icons.settings_outlined,
                    width: width,
                    height: height),
                const SizedBox(
                  width: 10,
                ),
                Container(
                    width: width * 0.04,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: DropdownButton<String>(
                        //value: "...",

                        icon: const Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 4,
                                color: Colors.blue,
                              ),
                              Icon(
                                Icons.circle,
                                size: 4,
                                color: Colors.blue,
                              ),
                              Icon(
                                Icons.circle,
                                size: 4,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),

                        elevation: 0,
                        style: const TextStyle(fontSize: 5, color: Colors.blue),
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (String? value) {},
                        items:
                        list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                CustomButton(
                    title: "0 / 11",
                    showIcon: true,
                    icon: Icons.school_outlined,
                    width: width,
                    height: height),
              ],
            )
          ],
        ),
      ),
    );
  }
}
