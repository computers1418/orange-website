import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../responsive/text_responsive.dart';

class BottomsheetHeader extends StatelessWidget {
  final String title1;
  final String title2;
  final String sub;
  final double? fontSize;
  final bool showStar;

  const BottomsheetHeader({super.key, required this.title1, required this.title2, required this.sub, this.fontSize, this.showStar = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

          Visibility(
            visible: showStar,
            child: Image.asset("res/icons/star_spark.gif", width: 90, height: 90,)),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text:title1, style: TextStyle(
                  fontFamily: "KumbhsansBold",
                  fontWeight: FontWeight.w900,
                  fontSize: TextResponsive.getResponsiveFontSize(context, 20),
                  height: 1,
                  color: const Color(0xFFFFFFFF )
                )),
                
                TextSpan(text:" $title2", style: TextStyle(
                  fontFamily: "KumbhsansBold",
                  fontWeight: FontWeight.w900,
                  fontSize:TextResponsive.getResponsiveFontSize(context, 20),
                  color: const Color(0xFFFFAD61)
                ))
              ]
            )
          ),
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: ImageIcon(AssetImage("res/icons/blink.png"), size: 6, color: Colors.white,)),
            Text(sub, style: TextStyle(
              fontFamily: "Kumbhsans",
              color: const Color(0xFFFFFFFF),
              fontSize: TextResponsive.getResponsiveFontSize(context, fontSize ?? 10),
              height: 1,
              fontWeight: FontWeight.w700
            )),
            const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: ImageIcon(AssetImage("res/icons/blink.png"), size: 6, color: Colors.white,))
          ],
        )
      ],
    );
  }
}