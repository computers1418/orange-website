import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header2 extends StatelessWidget {
  const Header2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: SizeResponsive.get(context, 52),
          child: Stack(
            children: [
              Positioned(
                left: 0 ,
                child: ImageIcon(const AssetImage("res/icons/blink.png"), size: SizeResponsive.get(context, 16), color: const Color(0xFFFFFFFF),)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text:"Affordable", style: TextStyle(
                        fontFamily: "BillSmith",
                        fontWeight: FontWeight.w800,
                        fontSize: TextResponsive.getResponsiveFontSize(context, 20),
                        height: 1,
                        color: const Color(0xFFFFFFFF )
                      )),
                      
                      TextSpan(text:"  dental", style: TextStyle(
                        fontFamily: "Kumbhsans",
                        fontWeight: FontWeight.w800,
                        fontSize: TextResponsive.getResponsiveFontSize(context, 32),
                        color: const Color(0x4DFFFFFF)
                      ))
                    ]
                  )
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: SizeResponsive.get(context, 52),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text:"care with", style: TextStyle(
                    fontFamily: "Kumbhsans",
                    fontWeight: FontWeight.w500,
                    fontSize: TextResponsive.getResponsiveFontSize(context, 16),
                    color: const Color(0x4DFFFFFF)
                  )),
                  
                  TextSpan(text:" exceptional service.", style: TextStyle(
                    fontFamily: "Kumbhsans",
                    fontWeight: FontWeight.w500,
                    fontSize: TextResponsive.getResponsiveFontSize(context, 16),
                    color: const Color(0xFFFFFFFF)
                  ))
                ]
              )
            ),
          ),
        ),
      ],
    );
  }
}