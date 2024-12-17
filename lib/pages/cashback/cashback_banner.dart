import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors_const.dart';

class CashbackBanner extends StatefulWidget {
  const CashbackBanner({super.key});

  @override
  State<CashbackBanner> createState() => _CashbackBannerState();
}

class _CashbackBannerState extends State<CashbackBanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("res/images/banner.png"),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 22.h),
                child: Row(
                  children: [
                    Image.asset(
                      "res/images/dentist_logo.png",
                      height: 34.h,
                      width: 121.h,
                      // width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Spacer(),
                    Image.asset(
                      "res/images/close.png",
                      height: 40.h,
                      width: 40.h,
                      // width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      child: Text(
                        'GET ₹50\nCASHBACK',
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: "Unbounded",
                          height: 0.9,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1.25
                            ..color = Colors.white.withOpacity(0.3),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      alignment: Alignment.center,
                    ),
                    Column(
                      children: [
                        Text(
                          "GET ₹50\nCASHBACK",
                          style: TextStyle(
                            fontFamily: "Unbounded",
                            color: const Color(0xFFFFFFFF),
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w700,
                            height: 0.9,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(-3.33, 3.33),
                                color: ColorsConst.text,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 4.h, horizontal: 9.h),
                          decoration: BoxDecoration(
                              color: ColorsConst.text,
                              borderRadius: BorderRadius.circular(20.h)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "WhatsApp screenshot to ",
                                style: TextStyle(
                                  fontFamily: "Kumbhsans",
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                "+91 90876 54321",
                                style: TextStyle(
                                  fontFamily: "Kumbhsans",
                                  color: ColorsConst.primary,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                " at avail reward",
                                style: TextStyle(
                                  fontFamily: "Kumbhsans",
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
