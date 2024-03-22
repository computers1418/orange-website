import 'package:flutter/material.dart';

import 'dialog_wrapper.dart';

class MailDialog extends StatelessWidget {
  final VoidCallback onSubmit;
  const MailDialog({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return DialogWrapper(
      onSubmit: onSubmit,
      title1: "OLD",
      title2: "MEMBER",
      sub: "Welcome back! Register your email with us",
      child1: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Email ID",
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
          Text("We Really Missed You!", style: TextStyle(
            fontFamily: "KumbhsansSemiBold",
            color: Color(0xFFFF8412),
            fontSize: 14,
            fontWeight: FontWeight.w800
          )),
          SizedBox(height: 4,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageIcon(AssetImage("res/icons/mail.png"), size: 10, color: Color(0xFFFF8412),),
              SizedBox(width: 4,),
              
              Expanded(
                child: Text("Register your email with us since you have forgot to do so last time.", style: TextStyle(
                  fontFamily: "Kumbhsans",
                  color: Color(0xFF2B275A),
                  fontSize: 8,
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