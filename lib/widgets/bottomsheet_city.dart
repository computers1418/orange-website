import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/extensions%20copy/number_exten.dart';
import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_header.dart';
import 'package:dentist_india_plus/widgets/city_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/city_controller.dart';
import 'app_info.dart';
import 'bottomsheet_close.dart';

class BottomsheetCity extends StatefulWidget {
  final VoidCallback onSelect;

  const BottomsheetCity({super.key, required this.onSelect});

  @override
  State<BottomsheetCity> createState() => _BottomsheetCityState();
}

class _BottomsheetCityState extends State<BottomsheetCity> {
  CityController putCityController = Get.put(CityController());
  late ScrollController
      _listScrollController; // ScrollController for the ListView
  CarouselSliderController controller = CarouselSliderController();
  int cityIndex = 0;

  @override
  void dispose() {
    _listScrollController
        .dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listScrollController = ScrollController();
    putCityController.getCitiesList();
  }

  void scrollList(int index) {
    double scrollOffset =
        index * 20.0; // Set this according to the height of your list items
    _listScrollController.animateTo(scrollOffset,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    // ValueNotifier<int> notifier = ValueNotifier(0);
    var height = MediaQuery.of(context).size.height;

    return GetBuilder<CityController>(
        init: CityController(),
        builder: (cityController) {
          // if (cityController.cities.isEmpty) {
          //   return Center(
          //     child:
          //         CircularProgressIndicator(), // Show a loader or some placeholder
          //   );
          // }
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
                    width: double.infinity,
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
                              width: double.infinity,
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
                                  cityController.cities.isEmpty
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : Align(
                                          alignment: Alignment.bottomCenter,
                                          child: CitySlider(
                                            controller: controller,
                                            onChanged: (idx) {
                                              setState(() {
                                                cityIndex = idx;
                                                scrollList(idx);
                                              });
                                            },
                                            onSelect: widget.onSelect,
                                          ))
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: () {
                                  if (cityController.cities.isNotEmpty) {
                                    if (cityIndex > 0) {
                                      setState(() {
                                        cityIndex -= 1;
                                        scrollList(cityIndex);
                                        controller.previousPage();
                                      });
                                    }
                                  }
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
                                onTap: () {
                                  if (cityController.cities.isNotEmpty) {
                                    if (cityIndex <
                                        cityController.cities.length - 1) {
                                      setState(() {
                                        cityIndex += 1;
                                        scrollList(cityIndex);
                                        controller.nextPage();
                                      });
                                    } else {
                                      setState(() {
                                        cityIndex = 0;
                                        scrollList(0);
                                        controller.animateToPage(0);
                                      });
                                    }
                                  }
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
                  cityController.cities.isEmpty
                      ? CircularProgressIndicator()
                      : Container(
                          height: SizeResponsive.get(
                              context, height > 700 ? 200 : 180),
                          margin: const EdgeInsets.symmetric(horizontal: 70),
                          decoration: BoxDecoration(
                              color: const Color(0x26FFFFFF),
                              border:
                                  Border.all(color: const Color(0x26FFFFFF)),
                              borderRadius: BorderRadius.circular(35)),
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            controller: _listScrollController,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            itemCount: cityController.cities.length,
                            itemBuilder: (_, idx) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    cityIndex = idx;
                                  });

                                  controller.animateToPage(cityIndex);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  decoration: BoxDecoration(
                                      color: cityIndex == idx
                                          ? Colors.white
                                          : null,
                                      borderRadius: BorderRadius.circular(30)),
                                  alignment: Alignment.center,
                                  child: Text(
                                      "${cityController.cities[idx].name}",
                                      style: TextStyle(
                                          fontFamily: "KumbhsansSemiBold",
                                          color: cityIndex == idx
                                              ? const Color(0xFFFF8412)
                                              : const Color(0xFFFFFFFF),
                                          fontSize: TextResponsive
                                              .getResponsiveFontSize(
                                                  context, 12),
                                          fontWeight: cityIndex == idx
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
