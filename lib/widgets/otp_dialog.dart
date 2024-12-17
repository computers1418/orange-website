import 'dart:async';

import 'package:dentist_india_plus/controller/consultation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import 'dialog_wrapper.dart';

class OtpDialog extends StatefulWidget {
  final VoidCallback onSubmit;
  final ValueChanged change;

  OtpDialog({super.key, required this.onSubmit, required this.change});

  @override
  State<OtpDialog> createState() => _OtpDialogState();
}

class _OtpDialogState extends State<OtpDialog> {
  int secondsRemaining = 30;
  Timer? timer;
  int resetCount = 0;
  final int resetLimit = 2;
  TextEditingController otpController = TextEditingController();
  ConsultationController consultationController =
      Get.put(ConsultationController());

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    if (resetCount < resetLimit) {
      consultationController.requestNewOtp(
        context,
        () {
          setState(() {
            resetCount++;
            secondsRemaining = 30;
          });
          timer?.cancel();
          startTimer();
        },
      );
    } else {
      // You can show a message when the reset limit is reached
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("You can only reset the timer twice."),
      ));
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secondsPart = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secondsPart";
  }

  @override
  Widget build(BuildContext context) {
    return DialogWrapper(
      onSubmit: () {
        consultationController.otpVerification(
            otpController.text, context, widget.onSubmit);
      },
      title1: "OTP",
      title2: "VERIFICATION",
      sub: "Enter OTP sent to your email and phone no.",
      child1: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Pinput(
            controller: otpController,
            length: 4,
            onChanged: widget.change,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            defaultPinTheme: PinTheme(
                decoration: BoxDecoration(
                    color: const Color(0xFFF4F4F7),
                    borderRadius: BorderRadius.circular(30)),
                constraints:
                    const BoxConstraints(maxHeight: 45, maxWidth: 60))),
      ),
      child2: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(formatTime(secondsRemaining),
                style: TextStyle(
                    fontFamily: "KumbhsansSemiBold",
                    color: Color(0xFFFF8412),
                    fontSize: 10,
                    fontWeight: FontWeight.w800)),
            SizedBox(
              height: 4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Didn’t Receive?",
                    style: TextStyle(
                        fontFamily: "KumbhsansSemiBold",
                        color: Color(0x802B275A),
                        fontSize: 10,
                        fontWeight: FontWeight.w800)),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: resetTimer,
                    child: Text("Send again",
                        style: TextStyle(
                            fontFamily: "Kumbhsans",
                            color: Color(0xFF2B275A),
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
