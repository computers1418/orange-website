import 'dart:ui';

import 'package:dentist_india_plus/controller/problem_controller.dart';
import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/model/medicine_model.dart';
import 'package:dentist_india_plus/model/set_problem_model.dart';
import 'package:dentist_india_plus/model/surgery_model.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_close.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_header.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_nav.dart';
import 'package:dentist_india_plus/widgets/medicine_item.dart';
import 'package:dentist_india_plus/widgets/service_item.dart';
import 'package:dentist_india_plus/widgets/surgery_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/doctor_controller.dart';
import '../widgets/notch.dart';

class SurgerySheet extends StatefulWidget {
  final Function(SurgeryModel) onChanged;

  const SurgerySheet({super.key, required this.onChanged});

  @override
  State<SurgerySheet> createState() => _SurgerySheetState();
}

class _SurgerySheetState extends State<SurgerySheet> {
  ProblemController problemController = Get.put(ProblemController());
  DoctorController doctorController = Get.put(DoctorController());
  SurgeryModel? select;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    problemController
        .getAllSurgeryList({"doctorId": doctorController.selectDoctor == null
        ? ""
        : doctorController.selectDoctor!.id});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    ValueNotifier notifier = ValueNotifier(null);

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: GetBuilder<ProblemController>(
        init: ProblemController(),
        builder: (controller) => Column(
          children: [
            const BottomsheetClose(),
            const BottomsheetHeader(
                title1: "CHOOSE",
                title2: "SURGERY",
                sub: "Choose surgery from the options below"),
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
                      controller.surgeryIsFetching.value
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Center(child: CircularProgressIndicator()),
                              ],
                            )
                          : controller.getSurgeryList.isEmpty
                              ? SizedBox()
                              : ListView.builder(
                                  itemBuilder: (context, index) {
                                    SurgeryModel model =
                                        controller.getSurgeryList[index];
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: SurgeryItem(
                                        selected: select == model,
                                        onClick: () {
                                          setState(() {
                                            select = model;
                                          });
                                          widget.onChanged(model);
                                        },
                                        model: model,
                                      ),
                                    );
                                  },
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: controller.getSurgeryList.length,
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
