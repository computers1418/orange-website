import 'package:dentist_india_plus/extensions/num_exten.dart';
import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';

class DoctorItem extends StatelessWidget {
  final String name;
  final String designation;
  final String location;
  final VoidCallback onClick;
  final VoidCallback onView;
  const DoctorItem({super.key, required this.name, required this.designation, required this.location, required this.onClick, required this.onView});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onView(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color(0xFFF2F7FB)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(name, style: TextStyle(
                  fontFamily: "KumbhsansSemiBold",
                  color: const Color(0xFF2B275A),
                  fontSize: TextResponsive.getResponsiveFontSize(context, 14),
                  fontWeight: FontWeight.w800
                )),
                Row(
                  children: [
                    const ImageIcon(AssetImage("res/icons/icon_loc.png"), size: 8, color: Color(0xFFFF8412),),
                    const SizedBox(width: 2,),
                    Text("$location, New Delhi.", style: TextStyle(
                      fontFamily: "Kumbhsans",
                      color: const Color(0xFFFF8412),
                      fontSize: TextResponsive.getResponsiveFontSize(context, 9),
                      fontWeight: FontWeight.w500
                    ))
                  ],
                ),
                const SizedBox(height: 4,),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      
                      decoration: const BoxDecoration(
                        color: Color(0xFF2B275A),
                        borderRadius: BorderRadius.all(Radius.circular(16 ))
                      ),
                      child: Row(
                        children: [
                          Text("Profile / Address", style: TextStyle(
                            fontFamily: "Kumbhsans",
                            color: const Color(0xFFFFFFFF),
                            fontSize: TextResponsive.getResponsiveFontSize(context, 9),
                            fontWeight: FontWeight.w500
                          )),
                          const SizedBox(width: 2,),
                          const Icon(Icons.arrow_forward, color: Colors.white, size: 12,)
                        ],
                      ),
                    ),
                  ],
                )
                ],
              ),
            ),
            CircleAvatar(
              radius: SizeResponsive.get(context, 15),
              backgroundColor: const Color(0xFFFF8412),
              child: ImageIcon(const AssetImage("res/icons/phone.png"), size: SizeResponsive.get(context, 18), color: const Color(0xFFFFFFFF)),
            ),
            8.hgap(),
            GestureDetector(
              onTap: onClick,
              child: Container(
                height: 30,
                width: 76,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFFFF8412)
                ),
                child: Text("SELECT", style: TextStyle(
                    fontFamily: "KumbhsansSemiBold",
                    color: Colors.white,
                    fontSize: TextResponsive.getResponsiveFontSize(context, 12),
                    fontWeight: FontWeight.w800
                  )),
              ),
            )
          ],
        ),
      ),
    );
  }
}