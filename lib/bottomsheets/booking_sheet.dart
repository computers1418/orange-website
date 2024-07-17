import 'dart:ui';

import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_header.dart';
import 'package:dentist_india_plus/widgets/calendar_carousel.dart';
import 'package:dentist_india_plus/widgets/notch.dart';
import 'package:dentist_india_plus/widgets/styled_subtext.dart';
import 'package:flutter/material.dart';

import '../widgets/bottomsheet_close.dart';
import '../widgets/bottomsheet_nav.dart';

class BookingSheet extends StatelessWidget {
  final ValueChanged onChanged;
  const BookingSheet({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var times = [
      "9:30am - 10:30am",
      "10:30am - 11:30am",
      "11:30am - 12:30pm",
      "2:00am - 3:30am",
      "3:30pm - 4:00pm",
      "4:00pm - 5:00pm",
      "3:30pm - 4:00pm",
      "4:00pm - 5:00pm"
    ];

    ValueNotifier<int> selected = ValueNotifier(-1);

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: Column(
        children: [
          const BottomsheetClose(),
          const BottomsheetHeader(
            title1: "SCHEDULE",
            title2: "BOOKING",
            sub: "Choose date & time from the options below",
          ),
          const SizedBox(
            height: 20,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 24),
                padding: EdgeInsets.fromLTRB(
                  20,
                  height < 600 ? 10 : 20,
                  20,
                  height < 600 ? 10 : 20,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(0),
                  ),
                ),
                child: Column(
                  children: [
                    const StyledSubtext(text1: "CHOOSE", text2: " DATE"),
                    SizedBox(
                      height: height < 600 ? 70 : 100,
                      width: MediaQuery.of(context).size.width,
                      child: const CalendarCarousel(),
                    ),
                    Container(
                      width: 70,
                      height: 6,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFFFF8412),
                      ),
                    ),
                    const Text(
                      'TODAY',
                      style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: Color(0xFFFF8412),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const StyledSubtext(text1: "CHOOSE", text2: " TIME"),
                    const SizedBox(
                      height: 16,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: times.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: height > 600 ? 3.2 : 4,
                      ),
                      itemBuilder: (_, idx) {
                        return GestureDetector(
                          onTap: () {
                            selected.value = idx;
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              onChanged(times[idx]);
                            });
                          },
                          child: ValueListenableBuilder(
                              valueListenable: selected,
                              builder: (context, value, child) {
                                return Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: selected.value == idx
                                        ? const Color(0xFFFF8412)
                                        : const Color(0xFFF2F7FB),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    times[idx],
                                    style: TextStyle(
                                      fontFamily: "KumbhsansSemiBold",
                                      color: selected.value == idx
                                          ? Colors.white
                                          : const Color(0xFF2B275A),
                                      fontSize:
                                          TextResponsive.getResponsiveFontSize(
                                              context, 12),
                                      height: 1,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                );
                              }),
                        );
                      },
                    ),
                    Visibility(
                      visible: height > 600,
                      child: const SizedBox(
                        height: 12,
                      ),
                    ),
                    const BottomsheetNav()
                  ],
                ),
              ),
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Notch(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
