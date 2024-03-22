import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../responsive/size_responsive.dart';

class CitySlider extends StatelessWidget {
  final VoidCallback onSelect;
  const CitySlider({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeResponsive.get(context, 200),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: SizeResponsive.get(context, 160),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 20, right: 200),
            child: Column(
              children: [
                Image.asset("res/images/city2.png", height: SizeResponsive.get(context, 120), width: double.infinity, fit: BoxFit.fill),
              ],
            ),
          ),
          Container(
            height: SizeResponsive.get(context, 160),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 20, left: 200),
            child: Column(
              children: [
                Image.asset("res/images/city3.png", height: SizeResponsive.get(context, 120), width: double.infinity, fit: BoxFit.fill),
              ],
            ),
          ),
          Container(
            height: SizeResponsive.get(context, 198),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 30,
                  color: Color(0x1A000000)
                )
              ]
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              children: [
                Image.asset("res/images/city1.png", height: SizeResponsive.get(context, 130), width: double.infinity, fit: BoxFit.fill),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text("Bengaluru", style: TextStyle(
                            fontFamily: "Kumbhsans",
                            color: const Color(0xFF2B275A),
                            fontSize: TextResponsive.getResponsiveFontSize(context, 13),
                            fontWeight: FontWeight.w700
                          )),
                    ),
                    GestureDetector(
                      onTap: onSelect,
                      child: Container(
                        height: SizeResponsive.get(context, 30),
                        width: 76,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFFFF8412)
                        ),
                        child: Text("SELECT", style: TextStyle(
                            fontFamily: "KumbhsansSemiBold",
                            color: Colors.white,
                            fontSize: TextResponsive.getResponsiveFontSize(context, 10),
                            fontWeight: FontWeight.w800
                          )),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
      
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: SizeResponsive.get(context, 40), height: SizeResponsive.get(context, 40),
              margin: const EdgeInsets.only(left: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(-5, 5),
                    blurRadius: 30,
                    color: Color(0x40000000)
                  )
                ]
              ),
              padding: const EdgeInsets.all(10),
              child: const ImageIcon(AssetImage("res/icons/back.png"), color: Color(0xFF2B275A)),
            ),
          ),
      
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: SizeResponsive.get(context, 40), height: SizeResponsive.get(context, 40),
              margin: const EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(-5, 5),
                    blurRadius: 30,
                    color: Color(0x40000000)
                  )
                ]
              ),
              padding: const EdgeInsets.all(10),
              child: const ImageIcon(AssetImage("res/icons/forward.png"), color: Color(0xFF2B275A)),
            ),
          )
        ],
      ),
    );
  }
}