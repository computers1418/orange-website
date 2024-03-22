import 'package:flutter/material.dart';

import '../responsive/text_responsive.dart';

class StyledSubtext extends StatelessWidget {
  final String text1;
  final String text2;
  const StyledSubtext({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
          children: [
            TextSpan(text:text1, style:  TextStyle(
              fontFamily: "KumbhsansBold",
              fontWeight: FontWeight.w900,
              fontSize: TextResponsive.getResponsiveFontSize(context, 16),
              height: 1,
              color: const Color(0xFFFF8412 )
            )),
            
            TextSpan(text:text2, style: TextStyle(
              fontFamily: "KumbhsansBold",
              fontWeight: FontWeight.w900,
              fontSize: TextResponsive.getResponsiveFontSize(context, 16),
              color: const Color(0xFF2B275A)
            ))
          ]
        )
      );
  }
}