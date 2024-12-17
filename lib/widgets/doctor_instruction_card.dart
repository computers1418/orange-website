import 'package:dentist_india_plus/controller/doctor_controller.dart';
import 'package:dentist_india_plus/extensions%20copy/number_exten.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../drawer/drawer_dialog.dart';
import 'custom_appbar2.dart';

class DoctorinstructionCard extends StatefulWidget {
  final ValueNotifier showProfile;
  final VoidCallback closeProfile;
  final VoidCallback closeCard;

  const DoctorinstructionCard(
      {super.key,
      required this.showProfile,
      required this.closeProfile,
      required this.closeCard});

  @override
  State<DoctorinstructionCard> createState() => _DoctorinstructionCardState();
}

class _DoctorinstructionCardState extends State<DoctorinstructionCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetBuilder<DoctorController>(
          init: DoctorController(),
          builder: (controller) => Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: const BoxDecoration(
              color: Color(0xFF2B275A),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder(
                  valueListenable: widget.showProfile,
                  builder: (_, val, __) {
                    return CustomAppBar2(
                      closeIcon: val ? Icons.arrow_back : null,
                      onMenuClick: () {
                        showDialog(
                          context: context,
                          builder: (_) => const DrawerDialog(),
                        );
                      },
                      onClose: () {
                        if (val) {
                          widget.closeProfile();
                        } else {
                          Navigator.pop(context);
                        }
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Doctor’s Instruction",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Kumbhsans",
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            controller.selectDoctor == null
                                ? ""
                                : controller.selectDoctor!.personalInfo.name,
                            style: TextStyle(
                              color: Color(0xFFFFA34E),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Kumbhsans",
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      10.h(),
                      Text(
                        controller.selectDoctor == null
                            ? ""
                            : (controller.selectDoctor!.guidelines.isNotEmpty
                                ? controller
                                    .selectDoctor!.guidelines.first["content"]
                                : ""),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Kumbhsans",
                          fontSize: 10,
                        ),
                      ),
                      10.h(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -5),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF2B275A),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
            ),
            margin: const EdgeInsets.only(left: 17),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () => widget.closeCard(),
              child: const Icon(
                Icons.arrow_drop_up_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
