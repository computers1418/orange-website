import 'package:dentist_india_plus/bottomsheets/billing_info_bottom_sheet.dart';
import 'package:dentist_india_plus/constants/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bottomsheets/booking_sheet.dart';
import '../../bottomsheets/medicine_sheet.dart';
import '../../bottomsheets/services_sheet.dart';
import '../../bottomsheets/surgery_sheet.dart';
import '../../bottomsheets/test_sheet.dart';
import '../../responsive/size_responsive.dart';
import '../../responsive/text_responsive.dart';
import '../../widgets/styled_button.dart';

class QuickBooking extends StatefulWidget {
  const QuickBooking({super.key});

  @override
  State<QuickBooking> createState() => _QuickBookingState();
}

class _QuickBookingState extends State<QuickBooking> {
  TextEditingController patientNameControlle = TextEditingController();
  TextEditingController consultationController = TextEditingController();
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController problemController = TextEditingController();
  TextEditingController surgeryController = TextEditingController();
  TextEditingController testController = TextEditingController();
  TextEditingController medicineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.h)),
        borderSide: BorderSide(color: Color(0xFFBFBECE)));

    var hintStyle = TextStyle(
        fontFamily: "Kumbhsans",
        color: const Color(0x4D2B275A),
        fontSize: TextResponsive.getResponsiveFontSize(context, 14),
        height: 1,
        fontWeight: FontWeight.w500);

    var textStyle = TextStyle(
        overflow: TextOverflow.ellipsis,
        fontFamily: 'Kumbhsans',
        fontSize: TextResponsive.getResponsiveFontSize(context, 14),
        fontWeight: FontWeight.w600,
        color: const Color(0xFF2B275A));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              // height: 248.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("res/images/riple_wave.png"),
                      fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 23.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 50),
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
                        Stack(
                          alignment: Alignment.centerRight,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorsConst.text,
                                  borderRadius: BorderRadius.circular(30.h)),
                              child: Text(
                                "Visit full website",
                                style: TextStyle(
                                  fontFamily: "Kumbhsans",
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 23.h, vertical: 12.h),
                            ),
                            Positioned(
                              right: -30.h,
                              child: Image.asset(
                                "res/images/right.png",
                                height: 40.h,
                                width: 40.h,
                                // width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.h, right: 20.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              "res/images/user_image.png",
                              height: 80.h,
                              width: 80.h,
                              // width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "res/images/location_pin.png",
                                  height: 13.h,
                                  width: 13.h,
                                  // width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  " 2.2 kms",
                                  style: TextStyle(
                                    fontFamily: "Kumbhsans",
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 80.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Dental Specialist",
                                  style: TextStyle(
                                    fontFamily: "Kumbhsans",
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "Dr. Rosaline\nRaymond ",
                                  style: TextStyle(
                                      fontFamily: "Kumbhsans",
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      height: 1),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 80.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Dental Clinic",
                                    style: TextStyle(
                                      fontFamily: "Kumbhsans",
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    "15 Chandni Chowk Road,\nBlock C, Greater Kailash 1,\nNew Delhi - 110048",
                                    style: TextStyle(
                                        fontFamily: "Kumbhsans",
                                        color: const Color(0xFFFFFFFF),
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        height: 1),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: ColorsConst.text,
                                          borderRadius:
                                              BorderRadius.circular(30.h)),
                                      child: Image.asset(
                                        "res/images/direction.png",
                                        height: 18.h,
                                        width: 18.h,
                                        // fit: BoxFit.fill,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7.h, horizontal: 17.h),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      "Clinic Map",
                                      style: TextStyle(
                                        fontFamily: "Kumbhsans",
                                        color: const Color(0xFFFFFFFF),
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 7.h,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: ColorsConst.text,
                                          borderRadius:
                                              BorderRadius.circular(30.h)),
                                      child: Image.asset(
                                        "res/images/whatsapp.png",
                                        height: 18.h,
                                        width: 18.h,
                                        // fit: BoxFit.fill,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7.h, horizontal: 17.h),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      "WhatsApp",
                                      style: TextStyle(
                                        fontFamily: "Kumbhsans",
                                        color: const Color(0xFFFFFFFF),
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 7.h,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: ColorsConst.text,
                                          borderRadius:
                                              BorderRadius.circular(30.h)),
                                      child: Image.asset(
                                        "res/images/call.png",
                                        height: 18.h,
                                        width: 18.h,
                                        // fit: BoxFit.fill,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7.h, horizontal: 17.h),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      "Call",
                                      style: TextStyle(
                                        fontFamily: "Kumbhsans",
                                        color: const Color(0xFFFFFFFF),
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "QUICK BOOKING ",
                  style: TextStyle(
                    fontFamily: "Kumbhsans",
                    color: ColorsConst.primary,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "FORM",
                  style: TextStyle(
                    fontFamily: "Kumbhsans",
                    color: ColorsConst.text,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 6.h, left: 20.h, right: 20.h),
                      child: SizedBox(
                        // height: 44.h,
                        child: TextField(
                          controller: patientNameControlle,
                          style: textStyle,
                          decoration: InputDecoration(
                              hintText: "Patients Name",
                              hintStyle: hintStyle,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              focusedBorder: border,
                              disabledBorder: border,
                              enabledBorder: border,
                              filled: true,
                              fillColor: Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 6.h, left: 20.h, right: 20.h),
                      child: GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          // height: 44.h,
                          child: TextFormField(
                            style: textStyle,
                            enabled: false,
                            onTap: () {},
                            readOnly: true,
                            controller: consultationController,
                            decoration: InputDecoration(
                                hintText: "Consultation",
                                hintStyle: hintStyle,
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: Color(0xFF2B275A),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                focusedBorder: border,
                                disabledBorder: border,
                                enabledBorder: border,
                                filled: true,
                                fillColor: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 6.h, left: 20.h, right: 20.h),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return BookingSheet(
                                  onChanged: (e) {
                                    dateTimeController.text = e;
                                    FocusScope.of(context).unfocus();
                                    Navigator.pop(context);
                                  },
                                );
                              });
                        },
                        child: SizedBox(
                          // height: 44.h,
                          child: TextFormField(
                            style: textStyle,
                            enabled: false,
                            onTap: () {},
                            readOnly: true,
                            controller: dateTimeController,
                            decoration: InputDecoration(
                                hintText: "Date & Time",
                                hintStyle: hintStyle,
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: Color(0xFF2B275A),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                focusedBorder: border,
                                disabledBorder: border,
                                enabledBorder: border,
                                filled: true,
                                fillColor: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 6.h, left: 20.h, right: 20.h),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return ServicesSheet(
                                  onChanged: (e) {
                                    problemController.text = e.problemName;
                                    FocusScope.of(context).unfocus();
                                    Navigator.pop(context);
                                  },
                                );
                              });
                        },
                        child: SizedBox(
                          // height: 44.h,
                          child: TextFormField(
                            style: textStyle,
                            enabled: false,
                            onTap: () {},
                            readOnly: true,
                            controller: problemController,
                            decoration: InputDecoration(
                                hintText: "Problem",
                                hintStyle: hintStyle,
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: Color(0xFF2B275A),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                focusedBorder: border,
                                disabledBorder: border,
                                enabledBorder: border,
                                filled: true,
                                fillColor: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 6.h, left: 20.h, right: 20.h),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return SurgerySheet(
                                  onChanged: (e) {
                                    surgeryController.text = e.surgeryName;
                                    FocusScope.of(context).unfocus();
                                    Navigator.pop(context);
                                  },
                                );
                              });
                        },
                        child: SizedBox(
                          // height: 44.h,
                          child: TextFormField(
                            style: textStyle,
                            enabled: false,
                            onTap: () {},
                            readOnly: true,
                            controller: surgeryController,
                            decoration: InputDecoration(
                                hintText: "Surgery",
                                hintStyle: hintStyle,
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: Color(0xFF2B275A),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                focusedBorder: border,
                                disabledBorder: border,
                                enabledBorder: border,
                                filled: true,
                                fillColor: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 6.h, left: 20.h, right: 20.h),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return TestSheet(
                                  onChanged: (e) {
                                    testController.text = e.testName;
                                    FocusScope.of(context).unfocus();
                                    Navigator.pop(context);
                                  },
                                );
                              });
                        },
                        child: SizedBox(
                          // height: 44.h,
                          child: TextFormField(
                            style: textStyle,
                            enabled: false,
                            onTap: () {},
                            readOnly: true,
                            controller: testController,
                            decoration: InputDecoration(
                                hintText: "Test",
                                hintStyle: hintStyle,
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: Color(0xFF2B275A),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                focusedBorder: border,
                                disabledBorder: border,
                                enabledBorder: border,
                                filled: true,
                                fillColor: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 6.h, left: 20.h, right: 20.h),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return MedicineSheet(
                                  onChanged: (e) {
                                    medicineController.text = e.medicineName;
                                    FocusScope.of(context).unfocus();
                                    Navigator.pop(context);
                                  },
                                );
                              });
                        },
                        child: SizedBox(
                          // height: 44.h,
                          child: TextFormField(
                            style: textStyle,
                            enabled: false,
                            onTap: () {},
                            readOnly: true,
                            controller: medicineController,
                            decoration: InputDecoration(
                                hintText: "Medicine",
                                hintStyle: hintStyle,
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: Color(0xFF2B275A),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                focusedBorder: border,
                                disabledBorder: border,
                                enabledBorder: border,
                                filled: true,
                                fillColor: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 20.h,
            // ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  // barrierColor: Color(0xFF2B275A).withOpacity(0.50),
                  context: context,
                  builder: (_) {
                    return BillingInfoBottomSheet();
                  },
                );
              },
              child: Container(
                height: 50.h,
                margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 0.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: const Color(0xFFFF8412),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xFFFF8412).withOpacity(0.8),
                        blurRadius: 20,
                        offset: Offset(0, 5)),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  "BOOK NOW",
                  style: TextStyle(
                    fontFamily: "Kumbhsans",
                    color: const Color(0xFFFFFFFF),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "res/images/insta_blue.png",
                  height: 30.h,
                  width: 30.h,
                ),
                SizedBox(
                  width: 6.h,
                ),
                Image.asset(
                  "res/images/twitter_blue.png",
                  height: 30.h,
                  width: 30.h,
                ),
                SizedBox(
                  width: 6.h,
                ),
                Image.asset(
                  "res/images/facebook_blue.png",
                  height: 30.h,
                  width: 30.h,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
