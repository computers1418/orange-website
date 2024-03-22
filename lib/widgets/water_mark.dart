import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';

class WaterMark extends StatelessWidget {
  const WaterMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Click On", style: TextStyle(
          fontFamily: "Kumbhsans",
          color: const Color(0xFFFFA959),
          fontSize: TextResponsive.getResponsiveFontSize(context, 28),
          height: 1,
          fontWeight: FontWeight.w800
        )),
        Text("Service", style: TextStyle(
          fontFamily: "KumbhsansSemiBold",
          color: const Color(0xFFFFA959),
          fontSize: TextResponsive.getResponsiveFontSize(context, 28),
          height: 1,
          fontWeight: FontWeight.w800
        ))
      ],
    );
  }
}