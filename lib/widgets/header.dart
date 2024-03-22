import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text("Confidence", style: TextStyle(
                  fontFamily: "BillSmith",
                  fontWeight: FontWeight.w800,
                  fontSize: TextResponsive.getResponsiveFontSize(context, 26),
                  color: const Color(0xFFFF8412 )
                )),
              ),
              const Positioned(
                right: 0,
                top: 0,
                child: ImageIcon(AssetImage("res/icons/blink.png"), size: 16, color: Color(0xFFFF9636),))
            ],
          ),
          const SizedBox(height: 10,),
          Text("STARTS WITH A HEALTHY\nSMILE", style: TextStyle(
            fontFamily: "Kumbhsans",
            fontWeight: FontWeight.w800,
            fontSize: TextResponsive.getResponsiveFontSize(context, 20),
            color: const Color(0xFF2B275A)
          ))
          // SizedBox(
          //   height:   48,
          //   child: Stack(
          //     children: [
          //       const Positioned(
          //         left: 190 ,
          //         child: ImageIcon(AssetImage("res/icons/blink.png"), size: 16, color: Color(0xFFFF9636),)),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 10),
          //         child: RichText(
          //           text: const TextSpan(
          //             children: [
          //               ,
                        
          //               TextSpan(text:"  starts", style: TextStyle(
          //                 fontFamily: "Kumbhsans",
          //                 fontWeight: FontWeight.w800,
          //                 fontSize: 32,
          //                 color: Color(0x4DFFFFFF)
          //               ))
          //             ]
          //           )
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // RichText(
          //   text: const TextSpan(
          //     children: [
          //       TextSpan(text:"STARTS WITH A HEALTHY\nSMILE", style: TextStyle(
          //         fontFamily: "Kumbhsans",
          //         fontWeight: FontWeight.w800,
          //         fontSize: 20,
          //         color: Color(0xFF2B275A)
          //       )),
          //     ]
          //   )
          // ),
        ],
      ),
    );
  }
}