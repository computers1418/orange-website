import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/extensions%20copy/context_exten.dart';
import 'package:dentist_india_plus/extensions%20copy/number_exten.dart';
import 'package:dentist_india_plus/extensions%20copy/string_exten.dart';
import 'package:dentist_india_plus/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/assets_const.dart';
import '../../widgets/custom_appbar3.dart';

class RefundPolicyView extends StatefulWidget {
  const RefundPolicyView({super.key});

  @override
  State<RefundPolicyView> createState() => _RefundPolicyViewState();
}

class _RefundPolicyViewState extends State<RefundPolicyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(AssetsConst.pattern))),
            child: Column(
              children: [
                const CustomAppBar3(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(26, 0, 26, 30),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          AssetsConst.terms,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      10.w(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "REFUND POLICY".bold(fontSize: 18),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text("Refund & Cancellation Policy",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                        fontFamily: "Kumbhsans",
                        color: Color(0xFF2B275A))),
                18.h(),
                const Text(
                    "Dentist India Plus follows a fair & transparent refund policy.",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Kumbhsans",
                        color: Color(0xFFA6A5B8))),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text:
                          "1) While there is option for any patient to cancel the appointment on their own once the payment is made, but that wouldn't entitle any patient the right to get any refund. ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: "Kumbhsans",
                          color: Color(0xFFA6A5B8))),
                  TextSpan(
                      text:
                          "Payment once made for appointment or any service, is totally (100%) non-refundable.",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: "Kumbhsans",
                          color: Color(0xFF807E95)))
                ])),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text:
                          "2) But patient can get in touch with our customer care ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: "Kumbhsans",
                          color: Color(0xFFA6A5B8))),
                  WidgetSpan(
                      child: GestureDetector(
                    onTap: () => context.goto(Routes.contact),
                    child: const Text(
                      "<fill the form / contact us>",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          fontFamily: "Kumbhsans",
                          color: Color(0xFFFF8412)),
                    ),
                  )),
                  const TextSpan(
                      text:
                          " or the get in touch with the selected/booked doctor (doctor whom patient booked) as soon as possible with their appointment number. Under special consideration, Dentist India Plus or the selected doctor can give a full or partial refund",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: "Kumbhsans",
                          color: Color(0xFFA6A5B8)))
                ])),
                ...refundContent.map((e) => Text(e,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Kumbhsans",
                        color: Color(0xFFA6A5B8)))),
                30.h(),
                const Text(
                  "Amit Sahoo Srichandan",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: "Kumbhsans",
                    color: Color(0xFFA6A5B8),
                  ),
                ),
                const Text(
                  "sahooamit1418@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: "Kumbhsans",
                    color: Color(0xFFA6A5B8),
                  ),
                ),
                const Text(
                  "M/s First Health and Technology Services",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: "Kumbhsans",
                    color: Color(0xFFA6A5B8),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
