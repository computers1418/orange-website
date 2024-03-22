import 'package:flutter/material.dart';

import '../responsive/size_responsive.dart';
import '../responsive/text_responsive.dart';

class CustomAppBar2 extends StatelessWidget {
  final IconData? closeIcon;
  final VoidCallback onClose;
  final VoidCallback onMenuClick;
  const CustomAppBar2({super.key, this.closeIcon, required this.onClose, required this.onMenuClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(SizeResponsive.get(context, 16), 8, SizeResponsive.get(context, 16), 8),
      child: Row(
        children: [


          Image.asset("res/icons/applogo.png", width: SizeResponsive.get(context, 30), height: 26),
          const SizedBox(width: 6,),

          Expanded(
            child: Stack(
              children: [
                 Positioned(
                left: TextResponsive.getResponsiveFontSize(context, 72),
                child: const ImageIcon(AssetImage("res/icons/blink.png"), size: 8, color: Color(0xFFFFFFFF),)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text("HFAVIRE", style: TextStyle(
                      fontFamily: "Kumbhsans",
                      color: const Color(0xFFFFFFFF),
                      fontSize: TextResponsive.getResponsiveFontSize(context, 14),
                      height: 1,
                      fontWeight: FontWeight.w800
                    )),
                      Text("IAUIV RLUA", style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: const Color(0xFFFFFFFF),
                        fontSize: TextResponsive.getResponsiveFontSize(context, 14),
                        height: 1,
                        fontWeight: FontWeight.w800
                      ))
                  ],
                ),
              ],
            ),
          ),


          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text("Location", style: TextStyle(
                fontFamily: "Kumbhsans",
                color: const Color(0xFFFFFFFF),
                fontSize: TextResponsive.getResponsiveFontSize(context, 6),
                height: 1,
                fontWeight: FontWeight.w500
              )),
                Row(
                  children: [
                    Text("DL", style: TextStyle(
                      fontFamily: "KumbhsansSemiBold",
                      color: const Color(0xFFFFFFFF),
                      fontSize: TextResponsive.getResponsiveFontSize(context, 12),
                      height: 1,
                      fontWeight: FontWeight.w800
                    )),
                    const Icon(Icons.arrow_drop_down, color: Colors.white, size: 14,)
                  ],
                )
            ],
          ),
          const SizedBox(width: 6,),
          GestureDetector(
            onTap: ()=>onClose(),
            child: Container(
              height: SizeResponsive.get(context, 35), width: SizeResponsive.get(context, 35),
              decoration: BoxDecoration(
                color: const Color(0x1AFFFFFF),
                border: Border.all(
                  color: const Color(0x0DFFFFFF)
                ),
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                    BoxShadow(blurRadius: 4, color: Color(0x1AFFFFFF)  )
                ]
              ),
              padding: const EdgeInsets.all(4),
              child: Icon(closeIcon?? Icons.arrow_back,  size: SizeResponsive.get(context, 18), color: const Color(0xFFFFFFFF),),
            ),
          ),
          const SizedBox(width: 6,),
          GestureDetector(
            onTap: ()=>onMenuClick(),
            child: Container(
              height: SizeResponsive.get(context, 35), width: SizeResponsive.get(context, 35),
              decoration: BoxDecoration(
                color: const Color(0x1AFFFFFF),
                border: Border.all(
                  color: const Color(0x0DFFFFFF)
                ),
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                    BoxShadow(blurRadius: 4, color: Color(0x1AFFFFFF)  )
                ]
              ),
              padding: const EdgeInsets.all(4),
              child: const ImageIcon(AssetImage("res/icons/menu.png"), color: Colors.white,)
            ),
          )

        ],
      ),
    );
  }
}