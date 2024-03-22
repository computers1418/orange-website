import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'dialog_wrapper.dart';

class OtpDialog extends StatelessWidget {
  final VoidCallback onSubmit;
  const OtpDialog({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return DialogWrapper(
      onSubmit: onSubmit,
      title1: "OTP",
      title2: "VERIFICATION",
      sub: "Enter OTP sent to your email and phone no.",
      child1: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Pinput(
          length: 4,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          defaultPinTheme: PinTheme(
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F7),
              borderRadius: BorderRadius.circular(30)
            ),
            constraints: const BoxConstraints(
              maxHeight: 45, maxWidth: 60
            )
          )
        ),
      ), 
      child2: const Padding(
        padding: EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("00:30", style: TextStyle(
                  fontFamily: "KumbhsansSemiBold",
                  color: Color(0xFFFF8412),
                  fontSize: 10,
                  fontWeight: FontWeight.w800
                )),
          SizedBox(height: 4,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Didn’t Receive?", style: TextStyle(
                  fontFamily: "KumbhsansSemiBold",
                  color: Color(0x802B275A),
                  fontSize: 10,
                  fontWeight: FontWeight.w800
                )),
              SizedBox(width: 4,),
              
              Expanded(
                child: Text("Send again", style: TextStyle(
                  fontFamily: "Kumbhsans",
                  color: Color(0xFF2B275A),
                  fontSize: 10,
                  fontWeight: FontWeight.w600
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