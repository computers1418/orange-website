import 'package:dentist_india_plus/controller/consultation_controller.dart';
import 'package:dentist_india_plus/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dialog_wrapper.dart';

class NumberDialog extends StatefulWidget {
  final VoidCallback onSubmit;
  final dynamic data;
  final ValueChanged change;

  NumberDialog(
      {super.key, required this.onSubmit, this.data, required this.change});

  @override
  State<NumberDialog> createState() => _NumberDialogState();
}

class _NumberDialogState extends State<NumberDialog> {
  ConsultationController consultationController =
      Get.put(ConsultationController());
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DialogWrapper(
      onSubmit: () {
        print(phoneController.text);
        if (isValidPhone(phoneController.text)) {
          consultationController.createConsult({
            "name": widget.data[0]["name"],
            "doctorId": widget.data[1]["doctor"] == null
                ? ""
                : (widget.data[1]["doctor"] as DoctorModel).id,
            "dateTime": widget.data[2]["dateTime"].toString(),
            "problem": [widget.data[5]["problem"]],
            "meds": [widget.data[6]["medicine"]],
            "test": [widget.data[4]["test"]],
            "surgery": [widget.data[7]["surgery"]],
            "modeOfPayment": "Cash",
            "phoneNumber": "${phoneController.text}",
            "modeOfTreatment": widget.data[3]["treatment"]
          }, context, widget.onSubmit);
        } else {
          print(true);
          consultationController.createConsult({
            "name": widget.data[0]["name"],
            "doctorId": widget.data[1]["doctor"] == null
                ? ""
                : (widget.data[1]["doctor"] as DoctorModel).id,
            "dateTime": widget.data[2]["dateTime"].toString(),
            "problem": [widget.data[5]["problem"]],
            "meds": [widget.data[6]["medicine"]],
            "test": [widget.data[4]["test"]],
            "surgery": [widget.data[7]["surgery"]],
            "modeOfPayment": "Cash",
            "emailId": "${phoneController.text}",
            "modeOfTreatment": widget.data[3]["treatment"]
          }, context, widget.onSubmit);
        }
      },
      title1: "CONFIRM",
      title2: "BOOKING",
      sub: "Enter your Phone no. or Email ID to Complete Booking",
      child1: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: TextFormField(
          controller: phoneController,
          onChanged: widget.change,
          decoration: InputDecoration(
              hintText: "Phone No. or Email ID",
              hintStyle: const TextStyle(
                  fontFamily: "Kumbhsans",
                  color: Color(0x4D2B275A),
                  fontSize: 14,
                  height: 1,
                  fontWeight: FontWeight.w700),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(color: Color(0xFFF4F4F7))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(color: Color(0xFFF4F4F7))),
              filled: true,
              fillColor: const Color(0xFFF4F4F7)),
        ),
      ),
      child2: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("21 Feb @ 11:00 am",
            Text(
                widget.data[2]["dateTime"].toString().isEmpty
                    ? "-"
                    : widget.data[2]["dateTime"],
                style: TextStyle(
                    fontFamily: "KumbhsansSemiBold",
                    color: Color(0xFF2B275A),
                    fontSize: 14,
                    fontWeight: FontWeight.w800)),
            Text("Dental Braces",
                style: TextStyle(
                    fontFamily: "Kumbhsans",
                    color: Color(0xFFFF8412),
                    fontSize: 9,
                    fontWeight: FontWeight.w500)),
            Row(
              children: [
                ImageIcon(
                  AssetImage("res/icons/icon_loc.png"),
                  size: 8,
                  color: Color(0xFFFF8412),
                ),
                SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: Text(
                      "12/2, Mathura Road, Sector 37, Faridabad - Delhi",
                      style: TextStyle(
                          fontFamily: "Kumbhsans",
                          color: Color(0xFF2B275A),
                          fontSize: 9,
                          fontWeight: FontWeight.w500)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  bool isValidPhone(String input) {
    final phoneRegExp = RegExp(r'^\d{10}$');
    return phoneRegExp.hasMatch(input);
  }
}
