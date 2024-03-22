import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback onMenuClick;
  const CustomAppBar({super.key, required this.onMenuClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 12, 0),
      child: Row(
        children: [
          ImageIcon(const AssetImage("res/icons/applogo.png"), size: SizeResponsive.get(context, 30), color: const Color(0xFFFF8412),),
          const SizedBox(width: 6,),

          Expanded(
            child: Stack(
              children: [
                const Positioned(
                left: 68,
                child: ImageIcon(AssetImage("res/icons/blink.png"), size: 8, color: Color(0xFFFF8412),)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text("HFAVIRE", style: TextStyle(
                      fontFamily: "Kumbhsans",
                      color: const Color(0xFF2B275A),
                      fontSize: TextResponsive.getResponsiveFontSize(context, 14),
                      height: 1,
                      fontWeight: FontWeight.w800
                    )),
                      Text("IAUIV RLUA", style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: const Color(0xFF2B275A),
                        fontSize: TextResponsive.getResponsiveFontSize(context, 14),
                        height: 1,
                        fontWeight: FontWeight.w800
                      ))
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 12,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text("Location", style: TextStyle(
                fontFamily: "Kumbhsans",
                color: const Color(0xFF2B275A),
                fontSize: TextResponsive.getResponsiveFontSize(context, 6),
                height: 1,
                fontWeight: FontWeight.w500
              )),
                Row(
                  children: [
                    Text("DL", style: TextStyle(
                      fontFamily: "KumbhsansSemiBold",
                      color: const Color(0xFF2B275A),
                      fontSize: TextResponsive.getResponsiveFontSize(context, 12),
                      height: 1,
                      fontWeight: FontWeight.w800
                    )),
                    const Icon(Icons.arrow_drop_down, color: Color(0xFF2B275A), size: 14,)
                  ],
                )
            ],
          ),
          const SizedBox(width: 8,),

          GestureDetector(
            onTap: ()=>onMenuClick(),
            child: CircleAvatar(
              radius: SizeResponsive.get(context, 18),
              backgroundColor: const Color(0xFFFF8412),
              child: const ImageIcon(AssetImage("res/icons/menu.png"), color: Colors.white,),
            ),
          )

        ],
      ),
    );
  }
}