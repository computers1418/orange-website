import 'dart:ui';

import 'package:dentist_india_plus/controller/doctor_controller.dart';
import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/model/doctor_model.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_header.dart';
import 'package:dentist_india_plus/widgets/doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/bottomsheet_close.dart';
import '../widgets/bottomsheet_nav.dart';
import '../widgets/notch.dart';

class DoctorsSheet extends StatefulWidget {
  final Function(DoctorModel) onSelected;
  final Function(DoctorModel) onView;
  final DoctorController doctorController;

  const DoctorsSheet(
      {super.key,
      required this.onSelected,
      required this.onView,
      required this.doctorController});

  @override
  State<DoctorsSheet> createState() => _DoctorsSheetState();
}

class _DoctorsSheetState extends State<DoctorsSheet> {
  // DoctorController doctorController = Get.put(DoctorController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.doctorController.getAllDoctorList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: GetBuilder<DoctorController>(
        init: DoctorController(),
        builder: (controller) => Column(
          children: [
            const BottomsheetClose(),
            const BottomsheetHeader(
                title1: "CHOOSE",
                title2: "DOCTORS",
                sub: "Choose your doctor from the options below"),
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  padding: EdgeInsets.fromLTRB(
                      20, height < 600 ? 10 : 20, 20, height < 600 ? 10 : 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(0))),
                  child: Column(
                    children: [
                      controller.isFetching.value
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Center(child: CircularProgressIndicator()),
                              ],
                            )
                          : controller.doctorList.isEmpty
                              ? SizedBox()
                              : Container(
                                  height: 300,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      DoctorModel model =
                                          controller.doctorList[index];
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: DoctorItem(
                                          name: model.personalInfo.name,
                                          location: model.address.city ?? "",
                                          onClick: () {
                                            widget.onSelected(model);
                                          },
                                          onView: () {
                                            Navigator.pop(context);
                                            widget.onView(model);
                                          },
                                        ),
                                      );
                                    },
                                    primary: false,
                                    shrinkWrap: true,
                                    itemCount: controller.doctorList.length,
                                  ),
                                ),
                      Visibility(
                          visible: height > 600,
                          child: const SizedBox(
                            height: 6,
                          )),
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
