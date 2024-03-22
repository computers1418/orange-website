import 'package:flutter/material.dart';

import 'dialog_wrapper.dart';

class ConfirmedDialog extends StatelessWidget {
  final VoidCallback onSubmit;
  const ConfirmedDialog({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return DialogWrapper(
      bottomMargin: 320,
      onSubmit: onSubmit,
      title1: "BOOKING",
      title2: "CONFIRMED",
      sub: "Hey! John, Your appointment is confirmed with Dr. Diana Cruz ",
      child1: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Image.asset("res/images/people.png", height: 150)
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