import 'dart:ui';

import 'package:dentist_india_plus/constants/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class BookingConfirmBottomsheet extends StatefulWidget {
  const BookingConfirmBottomsheet({super.key});

  @override
  State<BookingConfirmBottomsheet> createState() =>
      _BookingConfirmBottomsheetState();
}

class _BookingConfirmBottomsheetState extends State<BookingConfirmBottomsheet> {
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
                padding: EdgeInsets.symmetric(horizontal: 25.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.h)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Image.asset(
                      "res/icons/star_spark.gif",
                      width: 120,
                      height: 120,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("BOOKING ",
                            style: TextStyle(
                                fontFamily: "Kumbhsans",
                                color: ColorsConst.primary,
                                fontSize: 28.sp,
                                height: 1,
                                fontWeight: FontWeight.w800)),
                        Text("CONFIRMED",
                            style: TextStyle(
                                fontFamily: "Kumbhsans",
                                color: ColorsConst.text,
                                fontSize: 28.sp,
                                height: 1,
                                fontWeight: FontWeight.w800)),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Hey! John, Your appointment is confirmed with Dr. Diana Cruz ",
                      style: TextStyle(
                          fontFamily: "Kumbhsans",
                          color: ColorsConst.text,
                          fontSize: 10.sp,
                          height: 1,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Image.asset("res/images/people.png", height: 150),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("21 Feb @ 11:00 am",
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
                                            fontWeight: FontWeight.w700)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await Get.toNamed(Routes.cashbackBanner);
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xFFFF8412)),
                            child: const Text("SUBMIT",
                                style: TextStyle(
                                    fontFamily: "KumbhsansSemiBold",
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
