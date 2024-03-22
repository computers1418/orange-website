import 'package:flutter/material.dart';

import 'dialog_wrapper.dart';

class NumberDialog extends StatelessWidget {
  final VoidCallback onSubmit;
  const NumberDialog({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return DialogWrapper(
      onSubmit: onSubmit,
      title1: "CONFIRM",
      title2: "BOOKING",
      sub: "Enter your Phone no. or Email ID to Complete Booking",
      child1: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Phone No. or Email ID",
            hintStyle: const TextStyle(
              fontFamily: "Kumbhsans",
              color:Color(0x4D2B275A),
              fontSize: 14,
              height: 1,
              fontWeight: FontWeight.w700
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(color: Color(0xFFF4F4F7))
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(color: Color(0xFFF4F4F7))
            ),
            filled: true,
            fillColor: const Color(0xFFF4F4F7)
          ),
        ),
      ), 
      child2: const Padding(
        padding: EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("21 Feb @ 11:00 am", style: TextStyle(
            fontFamily: "KumbhsansSemiBold",
            color: Color(0xFF2B275A),
            fontSize: 14,
            fontWeight: FontWeight.w800
          )),
          Text("Dental Braces", style: TextStyle(
            fontFamily: "Kumbhsans",
            color: Color(0xFFFF8412),
            fontSize: 9,
            fontWeight: FontWeight.w500
          )),
          Row(
            children: [
              ImageIcon(AssetImage("res/icons/icon_loc.png"), size: 8, color: Color(0xFFFF8412),),
              SizedBox(width: 2,),
              Expanded(
                child: Text("12/2, Mathura Road, Sector 37, Faridabad - Delhi", style: TextStyle(
                  fontFamily: "Kumbhsans",
                  color: Color(0xFF2B275A),
                  fontSize: 9,
                  fontWeight: FontWeight.w500
                )),
              )
            ],
          )
          ],
        ),
      ),
    );
  }
}