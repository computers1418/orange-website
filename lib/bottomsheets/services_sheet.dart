import 'dart:ui';

import 'package:dentist_india_plus/controller/problem_controller.dart';
import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/model/set_problem_model.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_close.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_header.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_nav.dart';
import 'package:dentist_india_plus/widgets/service_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/doctor_controller.dart';
import '../widgets/notch.dart';

class ServicesSheet extends StatefulWidget {
  final Function(SetProblemModel) onChanged;

  const ServicesSheet({super.key, required this.onChanged});

  @override
  State<ServicesSheet> createState() => _ServicesSheetState();
}

class _ServicesSheetState extends State<ServicesSheet> {
  ProblemController problemController = Get.put(ProblemController());
  DoctorController doctorController = Get.put(DoctorController());
  SetProblemModel? select;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    problemController.getAllSetProblemList({
      "doctorId": doctorController.selectDoctor == null
          ? ""
          : doctorController.selectDoctor!.id,
      "isDoctor": "yes"
    });
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
                title2: "PROBLEM",
                sub: "Choose problem from the options below"),
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
                          : controller.getProblemList.isEmpty
                              ? SizedBox()
                              : ListView.builder(
                                  itemBuilder: (context, index) {
                                    SetProblemModel model =
                                        controller.getProblemList[index];
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: ServiceItem(
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
                                  itemCount: controller.getProblemList.length,
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
