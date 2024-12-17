import 'package:dentist_india_plus/bottomsheets/medicine_sheet.dart';
import 'package:dentist_india_plus/bottomsheets/surgery_sheet.dart';
import 'package:dentist_india_plus/bottomsheets/test_sheet.dart';
import 'package:dentist_india_plus/controller/city_controller.dart';
import 'package:dentist_india_plus/controller/doctor_controller.dart';
import 'package:dentist_india_plus/controller/treatment_controller.dart';
import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../bottomsheets/booking_sheet.dart';
import '../bottomsheets/doctorcall_sheet.dart';
import '../bottomsheets/doctors_sheet.dart';
import '../bottomsheets/services_sheet.dart';
import '../routes/app_routes.dart';
import 'appointment_type.dart';

class BookingForm extends StatefulWidget {
  final TextEditingController dateTime;
  final TextEditingController problem;
  final TextEditingController test;
  final TextEditingController medicine;
  final TextEditingController surgery;
  final TextEditingController doctor;
  final AnimationController bottomSheetController;
  final double sheet;
  final ValueNotifier showDoctor;
  final ValueNotifier selectedDoctor;
  final ValueChanged openProfile;
  final VoidCallback onSelected;
  final DoctorController doctorController;

  const BookingForm(
      {super.key,
      required this.dateTime,
      required this.problem,
      required this.test,
      required this.medicine,
      required this.surgery,
      required this.doctor,
      required this.bottomSheetController,
      required this.sheet,
      required this.showDoctor,
      required this.selectedDoctor,
      required this.openProfile,
      required this.onSelected,
      required this.doctorController});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  // DoctorController doctorController = Get.put(DoctorController());
  TreatmentController treatmentController = Get.put(TreatmentController());
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var border = const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        borderSide: BorderSide(color: Color(0xFFF4F4F7)));

    var hintStyle = TextStyle(
        fontFamily: "Kumbhsans",
        color: const Color(0x4D2B275A),
        fontSize: TextResponsive.getResponsiveFontSize(context, 14),
        height: 1,
        fontWeight: FontWeight.w500);

    var textStyle = TextStyle(
        overflow: TextOverflow.ellipsis,
        fontFamily: 'Kumbhsans',
        fontSize: TextResponsive.getResponsiveFontSize(context, 14),
        fontWeight: FontWeight.w600,
        color: const Color(0xFF2B275A));

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(6, 16, 6, 6),
          padding: EdgeInsets.fromLTRB(
              16, SizeResponsive.getHeightverse(context, 34), 16, 10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(50))),
          child: Column(
            children: [
              Visibility(
                  visible: MediaQuery.of(context).size.height > 800 &&
                      MediaQuery.of(context).size.width < 450,
                  child: const SizedBox(
                    height: 20,
                  )),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      height: SizeResponsive.getMaxHeight(context, 45),
                      child: TextField(
                        controller: nameController,
                        style: textStyle,
                        decoration: InputDecoration(
                            hintText: "Enter Name",
                            hintStyle: hintStyle,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                            focusedBorder: border,
                            disabledBorder: border,
                            enabledBorder: border,
                            filled: true,
                            fillColor: const Color(0xFFF4F4F7)),
                      ),
                    ),
                  ),
                  GetBuilder<CityController>(
                    init: CityController(),
                    builder: (controller) => Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                            color: const Color(0xFF2B275A),
                            borderRadius: BorderRadius.circular(24)),
                        child: Text(
                            controller.selectCity == null
                                ? ""
                                : controller.selectCity!.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: TextResponsive.getResponsiveFontSize(
                                    context, 11),
                                fontFamily: "Kumbhsans")),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return DoctorsSheet(
                                onView: (e) {
                                  widget.doctorController
                                      .changeDoctorProfile(e);
                                  widget.openProfile(e);
                                },
                                onSelected: (e) {
                                  Navigator.pop(context);
                                  widget.selectedDoctor.value = e;
                                  widget.doctor.setText(e.personalInfo.name);
                                  widget.doctorController.changeDoctor(e);
                                  treatmentController
                                      .getTreatmentModesByDoctorId(
                                          context, e.id);
                                  widget.bottomSheetController.forward();
                                  widget.showDoctor.value = true;
                                  widget.onSelected();
                                },
                                doctorController: widget.doctorController,
                              );
                            });
                      },
                      child: SizedBox(
                        height: SizeResponsive.getMaxHeight(context, 45),
                        child: TextField(
                          controller: widget.doctor,
                          readOnly: true,
                          enabled: false,
                          style: textStyle,
                          onTap: () {},
                          decoration: InputDecoration(
                              hintText: "Doctors",
                              hintStyle: hintStyle,
                              suffixIcon: const Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Color(0xFF2B275A),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              focusedBorder: border,
                              disabledBorder: border,
                              enabledBorder: border,
                              filled: true,
                              fillColor: const Color(0xFFF4F4F7)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 6,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return BookingSheet(
                                onChanged: (e) {
                                  widget.dateTime.text = e;
                                  FocusScope.of(context).unfocus();
                                  Navigator.pop(context);
                                },
                              );
                            });
                      },
                      child: SizedBox(
                        height: SizeResponsive.getMaxHeight(context, 45),
                        child: TextFormField(
                          style: textStyle,
                          enabled: false,
                          onTap: () {},
                          readOnly: true,
                          controller: widget.dateTime,
                          decoration: InputDecoration(
                              hintText: "Date & Time",
                              hintStyle: hintStyle,
                              suffixIcon: const Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Color(0xFF2B275A),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              focusedBorder: border,
                              disabledBorder: border,
                              enabledBorder: border,
                              filled: true,
                              fillColor: const Color(0xFFF4F4F7)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    // flex: 5,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return TestSheet(
                                onChanged: (e) {
                                  widget.test.text = e.testName;
                                  FocusScope.of(context).unfocus();
                                  Navigator.pop(context);
                                },
                              );
                            });
                      },
                      child: SizedBox(
                        height: SizeResponsive.getMaxHeight(context, 45),
                        child: TextField(
                          onTap: () {},
                          readOnly: true,
                          enabled: false,
                          controller: widget.test,
                          style: textStyle,
                          decoration: InputDecoration(
                              hintText: "Test",
                              hintStyle: hintStyle,
                              suffixIcon: const Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Color(0xFF2B275A),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              focusedBorder: border,
                              disabledBorder: border,
                              enabledBorder: border,
                              filled: true,
                              fillColor: const Color(0xFFF4F4F7)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    // flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return ServicesSheet(
                                onChanged: (e) {
                                  widget.problem.text = e.problemName;
                                  FocusScope.of(context).unfocus();
                                  Navigator.pop(context);
                                },
                              );
                            });
                      },
                      child: SizedBox(
                        height: SizeResponsive.getMaxHeight(context, 45),
                        child: TextField(
                          onTap: () {},
                          readOnly: true,
                          enabled: false,
                          controller: widget.problem,
                          style: textStyle,
                          decoration: InputDecoration(
                              hintText: "Problem",
                              hintStyle: hintStyle,
                              suffixIcon: const Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Color(0xFF2B275A),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              focusedBorder: border,
                              disabledBorder: border,
                              enabledBorder: border,
                              filled: true,
                              fillColor: const Color(0xFFF4F4F7)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    // flex: 5,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return MedicineSheet(
                                onChanged: (e) {
                                  widget.medicine.text = e.medicineName;
                                  FocusScope.of(context).unfocus();
                                  Navigator.pop(context);
                                },
                              );
                            });
                      },
                      child: SizedBox(
                        height: SizeResponsive.getMaxHeight(context, 45),
                        child: TextField(
                          onTap: () {},
                          readOnly: true,
                          enabled: false,
                          controller: widget.medicine,
                          style: textStyle,
                          decoration: InputDecoration(
                              hintText: "Medicine",
                              hintStyle: hintStyle,
                              suffixIcon: const Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Color(0xFF2B275A),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              focusedBorder: border,
                              disabledBorder: border,
                              enabledBorder: border,
                              filled: true,
                              fillColor: const Color(0xFFF4F4F7)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    // flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return SurgerySheet(
                                onChanged: (e) {
                                  widget.surgery.text = e.surgeryName;
                                  FocusScope.of(context).unfocus();
                                  Navigator.pop(context);
                                },
                              );
                            });
                      },
                      child: SizedBox(
                        height: SizeResponsive.getMaxHeight(context, 45),
                        child: TextField(
                          onTap: () {},
                          readOnly: true,
                          enabled: false,
                          controller: widget.surgery,
                          style: textStyle,
                          decoration: InputDecoration(
                              hintText: "Surgery",
                              hintStyle: hintStyle,
                              suffixIcon: const Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Color(0xFF2B275A),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              focusedBorder: border,
                              disabledBorder: border,
                              enabledBorder: border,
                              filled: true,
                              fillColor: const Color(0xFFF4F4F7)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                  visible: MediaQuery.of(context).size.height > 800 &&
                      MediaQuery.of(context).size.width < 450,
                  child: const SizedBox(
                    height: 30,
                  )),
              GetBuilder<DoctorController>(
                init: DoctorController(),
                builder: (doctorController) => GetBuilder<TreatmentController>(
                  init: TreatmentController(),
                  builder: (controller) => ValueListenableBuilder(
                      valueListenable: widget.showDoctor,
                      builder: (_, val, __) {
                        return Visibility(
                          visible: !val,
                          replacement: const SizedBox(
                            height: 64,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.payment, arguments: [
                                {"name": nameController.text},
                                {"doctor": doctorController.selectDoctor},
                                {"dateTime": widget.dateTime.text},
                                {"treatment": treatmentController.treatment},
                                {"test": widget.test.text},
                                {"problem": widget.problem.text},
                                {"medicine": widget.medicine.text},
                                {"surgery": widget.surgery.text},
                              ]);
                            },
                            child: Container(
                              width: SizeResponsive.get(context, 200),
                              height: SizeResponsive.getMaxHeight(context, 50),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: const Color(0xFF2B275A)),
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text("Complete Booking",
                                      style: TextStyle(
                                          fontFamily: "Kumbhsans",
                                          color: const Color(0xFFFFFFFF),
                                          fontSize: TextResponsive
                                              .getResponsiveFontSize(
                                                  context, 16),
                                          fontWeight: FontWeight.w700)),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              right: SizeResponsive.get(
                                                  context, 18),
                                              bottom: 14),
                                          child: const ImageIcon(
                                            AssetImage("res/icons/blink.png"),
                                            size: 10,
                                            color: Color(0xFFFF8412),
                                          )))
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: widget.sheet,
          right: 0,
          left: 0,
          child: GestureDetector(
            onTap: () {
              widget.bottomSheetController.reverse();
              widget.showDoctor.value = false;
            },
            child: const DoctorCallSheet(
              name: 'Alex',
            ),
          ),
        ),
        AppointmentType()
      ],
    );
  }
}
