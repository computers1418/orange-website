import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:flutter/material.dart';

import '../responsive/text_responsive.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50))
              ),
              margin: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Container(
                    width: 36,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                  ),
                   Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: SizeResponsive.get(context, 10)),
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: MediaQuery.of(context).size.height>=800 && MediaQuery.of(context).size.width <450 ?  const EdgeInsets.all(30) : EdgeInsets.zero,
                              child: Image.asset("res/images/img1.png",))),
                          Text("Dental Braces", textAlign: TextAlign.center, style: TextStyle(
                              fontFamily: "KumbhsansSemiBold",
                              color: const Color(0xFF2b275a),
                              fontSize: TextResponsive.getResponsiveFontSize(context, 16),
                              fontWeight: FontWeight.w800
                            )),
                          SizedBox(height: SizeResponsive.getHeightverse(context, 4),),
                          Text("Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum.  Class aptent taciti sociosqu ad litora torquent per conubia nostra, Nunc vulputate libero et velit interdum.", 
                          textAlign: TextAlign.center, 
                          style: TextStyle(
                              
                              fontFamily: "Kumbhsans",
                              color: const Color(0x802b275a),
                              fontSize: SizeResponsive.getHeightverse(context, 10),
                              fontWeight: FontWeight.w500
                            )),
                          SizedBox(height: SizeResponsive.getHeightverse(context, 26),)
                        ], 
                      )
                    ),
                  ),
                ],
              ),
            ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: Colors.white, width: 3)
                      ),
                      child: Container(
                      padding: EdgeInsets.symmetric(vertical: SizeResponsive.get(context, 8), horizontal: 12),
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFF2b275a),
                        ),
                        child: Text("Rs. 5,000", style: TextStyle(
                          fontFamily: "KumbhsansSemiBold",
                          color: const Color(0xFFFFFFFF),
                          fontSize: TextResponsive.getResponsiveFontSize(context, 12),
                          fontWeight: FontWeight.w800
                        )),
                      ),
                    ),
                  ),
          ],
        ),
      );
  }
}