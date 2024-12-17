import 'dart:ui';

import 'package:dentist_india_plus/bottomsheets/booking_confirm_bottomsheet.dart';
import 'package:dentist_india_plus/constants/colors_const.dart';
import 'package:dentist_india_plus/extensions%20copy/context_exten.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../data.dart';
import '../responsive/size_responsive.dart';
import '../responsive/text_responsive.dart';
import '../widgets/separator.dart';

class BillingInfoBottomSheet extends StatefulWidget {
  const BillingInfoBottomSheet({super.key});

  @override
  State<BillingInfoBottomSheet> createState() => _BillingInfoBottomSheetState();
}

class _BillingInfoBottomSheetState extends State<BillingInfoBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 18.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.h)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Patient",
                                  style: TextStyle(
                                      fontFamily: "Kumbhsans",
                                      color: const Color(0x992B275A),
                                      fontSize:
                                          TextResponsive.getResponsiveFontSize(
                                              context, height > 800 ? 12 : 10),
                                      height: 1,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: SizeResponsive.get(context, 3),
                              ),
                              Text("Appointment ID",
                                  style: TextStyle(
                                      fontFamily: "Kumbhsans",
                                      color: const Color(0x992B275A),
                                      fontSize:
                                          TextResponsive.getResponsiveFontSize(
                                              context, height > 800 ? 12 : 10),
                                      height: 1,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: SizeResponsive.get(context, 3),
                              ),
                              Text("Service",
                                  style: TextStyle(
                                      fontFamily: "Kumbhsans",
                                      color: const Color(0x992B275A),
                                      fontSize:
                                          TextResponsive.getResponsiveFontSize(
                                              context, height > 800 ? 12 : 10),
                                      height: 1,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: SizeResponsive.get(context, 3),
                              ),
                              Text("Date & Time",
                                  style: TextStyle(
                                      fontFamily: "Kumbhsans",
                                      color: const Color(0x992B275A),
                                      fontSize:
                                          TextResponsive.getResponsiveFontSize(
                                              context, height > 800 ? 12 : 10),
                                      height: 1,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("John Watson",
                                  style: TextStyle(
                                      fontFamily: "Kumbhsans",
                                      color: const Color(0xFF2B275A),
                                      fontSize:
                                          TextResponsive.getResponsiveFontSize(
                                              context, height > 800 ? 12 : 10),
                                      height: 1,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: SizeResponsive.get(context, 3),
                              ),
                              Text("DH73FH983RFDBN",
                                  style: TextStyle(
                                      fontFamily: "Kumbhsans",
                                      color: const Color(0xFF2B275A),
                                      fontSize:
                                          TextResponsive.getResponsiveFontSize(
                                              context, height > 800 ? 12 : 10),
                                      height: 1,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: SizeResponsive.get(context, 3),
                              ),
                              Text("Dental Braces",
                                  style: TextStyle(
                                      fontFamily: "Kumbhsans",
                                      color: const Color(0xFF2B275A),
                                      fontSize:
                                          TextResponsive.getResponsiveFontSize(
                                              context, height > 800 ? 12 : 10),
                                      height: 1,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: SizeResponsive.get(context, 3),
                              ),
                              Text("21 Feb, 11:00 AM",
                                  style: TextStyle(
                                      fontFamily: "Kumbhsans",
                                      color: const Color(0xFF2B275A),
                                      fontSize:
                                          TextResponsive.getResponsiveFontSize(
                                              context, height > 800 ? 12 : 10),
                                      height: 1,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.h),
                    padding: EdgeInsets.all(20.h),
                    decoration: BoxDecoration(
                        color: ColorsConst.text,
                        borderRadius: BorderRadius.circular(25.h)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "BILLING",
                              style: TextStyle(
                                  fontFamily: "KumbhsansBold",
                                  fontWeight: FontWeight.w900,
                                  fontSize:
                                      TextResponsive.getResponsiveFontSize(
                                          context, 14),
                                  height: 1,
                                  color: const Color(0xFFFF8412))),
                          TextSpan(
                              text: " DETAILS",
                              style: TextStyle(
                                  fontFamily: "KumbhsansBold",
                                  fontWeight: FontWeight.w900,
                                  fontSize:
                                      TextResponsive.getResponsiveFontSize(
                                          context, 14),
                                  color: Colors.white))
                        ])),
                        SizedBox(
                          height: height > 800 ? 12 : 6,
                        ),
                        ...billing.map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${e['name']}",
                                      style: TextStyle(
                                          fontFamily: "Kumbhsans",
                                          color: Colors.white.withOpacity(0.50),
                                          fontSize: TextResponsive
                                              .getResponsiveFontSize(
                                                  context, 10),
                                          height: 1,
                                          fontWeight: FontWeight.w500)),
                                  Text("${e['value']}",
                                      style: TextStyle(
                                          fontFamily: "Kumbhsans",
                                          color: Colors.white,
                                          fontSize: TextResponsive
                                              .getResponsiveFontSize(
                                                  context, 10),
                                          height: 1,
                                          fontWeight: FontWeight.w900)),
                                ],
                              ),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("Coupons",
                                    style: TextStyle(
                                        fontFamily: "Kumbhsans",
                                        color: Colors.white,
                                        fontSize: TextResponsive
                                            .getResponsiveFontSize(context, 10),
                                        height: 1,
                                        fontWeight: FontWeight.w900)),
                                Container(
                                  margin: const EdgeInsets.only(left: 4),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: const Color(0x21FF8412),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      Text("Health100",
                                          style: TextStyle(
                                              fontFamily: "Kumbhsans",
                                              color: const Color(0xFFFF8412),
                                              fontSize: TextResponsive
                                                  .getResponsiveFontSize(
                                                      context, 10),
                                              height: 1,
                                              fontWeight: FontWeight.w900)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 12,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 4),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: const Color(0x21FF8412),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      Text("Consult100",
                                          style: TextStyle(
                                              fontFamily: "Kumbhsans",
                                              color: const Color(0xFFFF8412),
                                              fontSize: TextResponsive
                                                  .getResponsiveFontSize(
                                                      context, 10),
                                              height: 1,
                                              fontWeight: FontWeight.w900)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 12,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text("- Rs. 200",
                                style: TextStyle(
                                    fontFamily: "Kumbhsans",
                                    color: const Color(0xFFFF5151),
                                    fontSize:
                                        TextResponsive.getResponsiveFontSize(
                                            context, 10),
                                    height: 1,
                                    fontWeight: FontWeight.w900)),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const Separator(color: Colors.grey),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Payable Amount",
                                style: TextStyle(
                                    fontFamily: "Kumbhsans",
                                    color: Colors.white,
                                    fontSize:
                                        TextResponsive.getResponsiveFontSize(
                                            context, 12),
                                    height: 1,
                                    fontWeight: FontWeight.w900)),
                            Text("Rs. 1000",
                                style: TextStyle(
                                    fontFamily: "Kumbhsans",
                                    color: Colors.white,
                                    fontSize:
                                        TextResponsive.getResponsiveFontSize(
                                            context, 12),
                                    height: 1,
                                    fontWeight: FontWeight.w900)),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.h),
                    decoration: BoxDecoration(
                        color: ColorsConst.primary,
                        borderRadius: BorderRadius.circular(40.h)),
                    child: Row(
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            "res/images/location_map.png",
                            width: 90.h,
                            height: 80.h,
                          ),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(40.h)),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dental Clinic",
                                  style: TextStyle(
                                      fontFamily: "Kumbhsans",
                                      color: Colors.white,
                                      fontSize: 15.h,
                                      height: 1,
                                      fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                  "12/2, Mathura Road, Sector\n37, Faridabad - Delhi",
                                  style: TextStyle(
                                      fontFamily: "Kumbhsans",
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 10.h,
                                      height: 1,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        Image.asset(
                          "res/images/call_white.png",
                          height: 40.h,
                          width: 40.h,
                        ),
                        SizedBox(
                          width: 20.h,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("DENTAL BRACES",
                      style: TextStyle(
                          fontFamily: "Kumbhsans",
                          color: ColorsConst.text,
                          fontSize: 15.h,
                          height: 1,
                          fontWeight: FontWeight.w800)),
                  Text("21 FEB, 11:00 AM",
                      style: TextStyle(
                          fontFamily: "Kumbhsans",
                          color: ColorsConst.primary,
                          fontSize: 24.h,
                          height: 1,
                          fontWeight: FontWeight.w800)),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 44.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.h),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.2))),
                    padding: EdgeInsets.symmetric(horizontal: 35.h),
                    child: Text("BACK",
                        style: TextStyle(
                            fontFamily: "Kumbhsans",
                            color: Colors.white.withOpacity(0.2),
                            fontSize: 14.h,
                            height: 1,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                SizedBox(
                  width: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      // barrierColor: Color(0xFF2B275A).withOpacity(0.50),
                      context: context,
                      builder: (_) {
                        return BookingConfirmBottomsheet();
                      },
                    );
                  },
                  child: Container(
                    height: 44.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorsConst.primary,
                        borderRadius: BorderRadius.circular(25.h),
                        boxShadow: [
                          BoxShadow(color: ColorsConst.primary, blurRadius: 30)
                        ]),
                    padding: EdgeInsets.symmetric(horizontal: 25.h),
                    child: Text("Pay with Cash",
                        style: TextStyle(
                            fontFamily: "Kumbhsans",
                            color: Colors.white,
                            fontSize: 12.h,
                            height: 1,
                            fontWeight: FontWeight.w700)),
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
