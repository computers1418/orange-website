import 'package:dentist_india_plus/controller/doctor_controller.dart';
import 'package:dentist_india_plus/controller/treatment_controller.dart';
import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentType extends StatefulWidget {
  AppointmentType({super.key});

  @override
  State<AppointmentType> createState() => _AppointmentTypeState();
}

class _AppointmentTypeState extends State<AppointmentType> {
  TreatmentController treatmentController = Get.put(TreatmentController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TreatmentController>(
      init: TreatmentController(),
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: controller.treatmentModeList.isEmpty
            ? SizedBox()
            : Row(
                mainAxisAlignment: controller.treatmentModeList.length == 1
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: controller.treatmentModeList
                    .map((e) => GestureDetector(
                          onTap: () => treatmentController.onChangeTreatment(e),
                          child: Container(
                            decoration: BoxDecoration(
                                color: controller.treatment == e
                                    ? const Color(0xFFFF8412)
                                    : Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                border: Border.all(
                                    color: controller.treatment == e
                                        ? Colors.white
                                        : const Color(0xFFFF8412),
                                    width: 3)),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                vertical: SizeResponsive.get(context, 8),
                                horizontal: 10),
                            child: Text('${e}',
                                style: TextStyle(
                                    color: controller.treatment == e
                                        ? Colors.white
                                        : const Color(0xFFFF8412),
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        TextResponsive.getResponsiveFontSize(
                                            context, 10),
                                    fontFamily: "Kumbhsans")),
                          ),
                        ))
                    .toList()),
      ),
    );
  }
}
