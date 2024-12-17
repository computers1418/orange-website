import 'dart:ui';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:dentist_india_plus/controller/doctor_controller.dart';
import 'package:dentist_india_plus/controller/set_schedule_controller.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_header.dart';
import 'package:dentist_india_plus/widgets/calendar_carousel.dart';
import 'package:dentist_india_plus/widgets/notch.dart';
import 'package:dentist_india_plus/widgets/styled_subtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/schedule_model.dart';
import '../widgets/bottomsheet_close.dart';
import '../widgets/bottomsheet_nav.dart';

class BookingSheet extends StatefulWidget {
  final ValueChanged onChanged;

  const BookingSheet({super.key, required this.onChanged});

  @override
  State<BookingSheet> createState() => _BookingSheetState();
}

class _BookingSheetState extends State<BookingSheet> {
  SetScheduleController setScheduleController =
      Get.put(SetScheduleController());
  DoctorController doctorController = Get.put(DoctorController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setScheduleController.getScheduleByDate({
      "doctorId": doctorController.selectDoctor == null
          ? ""
          : doctorController.selectDoctor!.id,
      "dateArray": ["${DateFormat("yyyy-MM-dd").format(DateTime.now())}"]
    }, context);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    ValueNotifier<int> selected = ValueNotifier(-1);

    return GetBuilder<SetScheduleController>(
      init: SetScheduleController(),
      builder: (controller) => BackdropFilter(
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
                        child: CalendarCarousel(
                          function: (p0) {
                            setScheduleController.getScheduleByDate({
                              "doctorId": "66bf3adcdd3df57c89074fe1",
                              "dateArray": [
                                "${DateFormat("yyyy-MM-dd").format(p0)}"
                              ]
                            }, context);
                          },
                        ),
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
                      controller.isDataLoading.value
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Center(child: CircularProgressIndicator()),
                              ],
                            )
                          : controller.schduleList.isEmpty
                              ? SizedBox()
                              : GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      controller.schduleList.first.slots.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: height > 600 ? 3.2 : 4,
                                  ),
                                  itemBuilder: (_, idx) {
                                    Slot slots =
                                        controller.schduleList.first.slots[idx];
                                    return GestureDetector(
                                      onTap: () {
                                        widget.onChanged(
                                            "${controller.schduleList.first.date} ${slots.slotStartTime.split(" ")[1]} ${slots.slotStartTime.split(" ")[2]}");
                                      },
                                      child: ValueListenableBuilder(
                                          valueListenable: selected,
                                          builder: (context, value, child) {
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: selected.value == idx
                                                    ? const Color(0xFFFF8412)
                                                    : const Color(0xFFF2F7FB),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${slots.slotStartTime.split(" ")[1]} ${slots.slotStartTime.split(" ")[2]} - ${slots.slotEndTime.split(" ")[1]} ${slots.slotEndTime.split(" ")[2]}",
                                                style: TextStyle(
                                                  fontFamily:
                                                      "KumbhsansSemiBold",
                                                  color: selected.value == idx
                                                      ? Colors.white
                                                      : const Color(0xFF2B275A),
                                                  fontSize: TextResponsive
                                                      .getResponsiveFontSize(
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
      ),
    );
  }
}
