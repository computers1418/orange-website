import 'dart:ui';

import 'package:dentist_india_plus/model/test_model.dart';
import 'package:dentist_india_plus/widgets/test_service_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/doctor_controller.dart';
import '../controller/problem_controller.dart';
import '../widgets/bottomsheet_close.dart';
import '../widgets/bottomsheet_header.dart';
import '../widgets/bottomsheet_nav.dart';
import '../widgets/notch.dart';
import '../widgets/service_item.dart';

class TestSheet extends StatefulWidget {
  final Function(TestModel) onChanged;

  const TestSheet({super.key, required this.onChanged});

  @override
  State<TestSheet> createState() => _TestSheetState();
}

class _TestSheetState extends State<TestSheet> {
  ProblemController problemController = Get.put(ProblemController());
  DoctorController doctorController = Get.put(DoctorController());
  TestModel? select;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    problemController.getAllTestList({
      "doctorId": doctorController.selectDoctor == null
          ? ""
          : doctorController.selectDoctor!.id
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

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
                title2: "TEST",
                sub: "Choose test from the options below"),
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
                      controller.testIsFetching.value
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Center(child: CircularProgressIndicator()),
                              ],
                            )
                          : controller.getTestList.isEmpty
                              ? SizedBox()
                              : ListView.builder(
                                  itemBuilder: (context, index) {
                                    TestModel model =
                                        controller.getTestList[index];
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: TestServiceItem(
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
                                  itemCount: controller.getTestList.length,
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
