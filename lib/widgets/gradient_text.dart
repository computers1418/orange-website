import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart' as gt;

import '../responsive/text_responsive.dart';

class GradientText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  const GradientText({super.key, required this.text, this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return gt.GradientText(
        text,
        style: TextStyle(
          fontFamily: "KumbhsansSemiBold",
          fontWeight: fontWeight ?? FontWeight.w800,
          height: 1,
          fontSize: TextResponsive.getResponsiveFontSize(context, fontSize ?? 10),
          color: const Color(0xFFFFFFFF)
        ),
        gradientType: gt.GradientType.linear,
        colors: const [Color(0xFFFFC895), Color(0xFFFF8412)]
    );
    
    
    // ShaderMask(
    //   shaderCallback: (Rect bounds) {
    //     return const LinearGradient(
    //       colors: ,
    //       begin: Alignment.centerLeft,
    //       end: Alignment.centerRight,
    //     ).createShader(bounds);
    //   },
    //   child: Text(text, style: ),
    // );
  }
}