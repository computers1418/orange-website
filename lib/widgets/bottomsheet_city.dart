import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/extensions%20copy/number_exten.dart';
import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_header.dart';
import 'package:dentist_india_plus/widgets/city_slider.dart';
import 'package:flutter/material.dart';
import 'app_info.dart';
import 'bottomsheet_close.dart';

class BottomsheetCity extends StatelessWidget {
  final VoidCallback onSelect;
  const BottomsheetCity({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> notifier = ValueNotifier(0);
    var height = MediaQuery.of(context).size.height;
    CarouselController controller = CarouselController();

    return ValueListenableBuilder(
        valueListenable: notifier,
        builder: (_, selected, __) {
          controller.animateToPage(selected);

          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: SizeResponsive.get(context, 50)),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeResponsive.get(context, 270),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          "res/images/strip2.png",
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Stack(
                          children: [
                            Container(
                              height: SizeResponsive.get(context, 292),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                  color: const Color(0x26FFFFFF),
                                  border: Border.all(
                                      color: const Color(0x26FFFFFF)),
                                  borderRadius: BorderRadius.circular(35)),
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: BottomsheetHeader(
                                        title1: "CHOOSE",
                                        title2: "CITY",
                                        fontSize: 10,
                                        sub:
                                            "Choose your city from the options below"),
                                  ),
                                  10.h(),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: CitySlider(
                                        controller: controller,
                                        onChanged: (idx) {
                                          notifier.value = idx;
                                        },
                                        onSelect: onSelect,
                                        selectedCity:
                                            '${cityItems[notifier.value]['city']}',
                                        onForward: () {
                                          if (notifier.value <
                                              cityItems.length - 1) {
                                            notifier.value =
                                                (notifier.value + 1);
                                          }
                                        },
                                        onBack: () {
                                          if (notifier.value > 0) {
                                            notifier.value =
                                                (notifier.value - 1);
                                          }
                                        },
                                      ))
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: () => {
                                  if (notifier.value > 0)
                                    {notifier.value = (notifier.value - 1)}
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 0, top: 24),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Image.asset(
                                      "res/images/circle_left.png",
                                      width: SizeResponsive.get(context, 60),
                                      height: SizeResponsive.get(context, 60)),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () => {
                                  if (notifier.value < cityItems.length - 1)
                                    {notifier.value = (notifier.value + 1)}
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(right: 0, top: 24),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Image.asset(
                                      "res/images/circle_right.png",
                                      width: SizeResponsive.get(context, 60),
                                      height: SizeResponsive.get(context, 60)),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height:
                        SizeResponsive.get(context, height > 700 ? 200 : 180),
                    margin: const EdgeInsets.symmetric(horizontal: 70),
                    decoration: BoxDecoration(
                        color: const Color(0x26FFFFFF),
                        border: Border.all(color: const Color(0x26FFFFFF)),
                        borderRadius: BorderRadius.circular(35)),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: cityItems.length,
                      itemBuilder: (_, idx) {
                        return GestureDetector(
                          onTap: () => notifier.value = idx,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                                color: selected == idx ? Colors.white : null,
                                borderRadius: BorderRadius.circular(30)),
                            alignment: Alignment.center,
                            child: Text("${cityItems[idx]['city']}",
                                style: TextStyle(
                                    fontFamily: "KumbhsansSemiBold",
                                    color: selected == idx
                                        ? const Color(0xFFFF8412)
                                        : const Color(0xFFFFFFFF),
                                    fontSize:
                                        TextResponsive.getResponsiveFontSize(
                                            context, 12),
                                    fontWeight: selected == idx
                                        ? FontWeight.w800
                                        : FontWeight.w500)),
                          ),
                        );
                      },
                    ),
                  ),
                  const Expanded(child: BottomsheetClose()),
                  const SizedBox(height: 70, child: AppInfo())
                ],
              ),
            ),
          );
        });
  }
}
