import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:dentist_india_plus/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottomsheet_city.dart';
import 'confirmed_dialog.dart';
import 'mail_dialog.dart';
import 'number_dialog.dart';
import 'otp_dialog.dart';

class DoctorPay extends StatelessWidget {
  const DoctorPay({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<double> dialogNotifier = ValueNotifier(0);

    var height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.fromLTRB(16, SizeResponsive.get(context, 12), 16,
          SizeResponsive.get(context, 4)),
      decoration: BoxDecoration(
          color: const Color(0xFF2B275A),
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(SizeResponsive.get(context, 25)))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dr. Veronica Smith",
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: "Kumbhsans",
                        overflow: TextOverflow.ellipsis,
                        color: const Color(0xFFFFFFFF),
                        fontSize:
                            TextResponsive.getResponsiveFontSize(context, 14),
                        height: 1,
                        fontWeight: FontWeight.w800)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 4),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Color(0x1AFF8412)),
                      child: Text("Call Doctor Directly",
                          style: TextStyle(
                              fontFamily: "Kumbhsans",
                              color: const Color(0xFFFFA048),
                              fontSize: TextResponsive.getResponsiveFontSize(
                                  context, 10),
                              height: 1,
                              fontWeight: FontWeight.w800)),
                    ),
                    SizedBox(
                      width: SizeResponsive.get(context, 4),
                    ),
                    ImageIcon(const AssetImage("res/icons/sqrillnav.png"),
                        size: SizeResponsive.get(context, 34),
                        color: const Color(0xFFFFFFFF)),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: SizeResponsive.get(context, 10),
          ),
          CircleAvatar(
            backgroundColor: const Color(0xFFFF8412),
            radius: SizeResponsive.get(context, 20),
            child: const Icon(
              Icons.phone,
              color: Color(0xFFF9F9F9),
              size: 20,
            ),
          ),
          SizedBox(
            width: SizeResponsive.get(context, 10),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) {
                  return ValueListenableBuilder(
                    valueListenable: dialogNotifier,
                    builder: (_, val, __) {
                      return val == 0
                          // ? BottomsheetCity(
                          //     onSelect: () => dialogNotifier.value = 1,
                          //   )
                          // :
                          // val == 1
                          ? NumberDialog(
                              onSubmit: () => dialogNotifier.value = 1,
                            )
                          // : val == 1
                          //     ? MailDialog(
                          //         onSubmit: () => dialogNotifier.value = 3,
                          //       )
                          : val == 1
                              ? OtpDialog(
                                  onSubmit: () => dialogNotifier.value = 3)
                              : ConfirmedDialog(
                                  onSubmit: () {
                                    Get.offAndToNamed(Routes.splash);
                                  },
                                );
                    },
                  );
                },
              );
            },
            child: Container(
              width: SizeResponsive.get(context, 120),
              height: height > 700 ? 45 : SizeResponsive.get(context, 40),
              margin: const EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: const Color(0xFFFF8412)),
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text("Pay Cash",
                      style: TextStyle(
                          fontFamily: "Kumbhsans",
                          color: const Color(0xFFFFFFFF),
                          fontSize:
                              TextResponsive.getResponsiveFontSize(context, 14),
                          fontWeight: FontWeight.w700)),
                  const Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: EdgeInsets.only(right: 14, bottom: 14),
                          child: ImageIcon(
                            AssetImage("res/icons/blink.png"),
                            size: 10,
                            color: Color(0xFFFFFFFF),
                          )))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
