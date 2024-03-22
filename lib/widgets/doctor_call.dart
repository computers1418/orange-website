import 'package:dentist_india_plus/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorCall extends StatelessWidget {
  const DoctorCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: const BoxDecoration(
        color: Color(0xFF2B275A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                const Text("Dr. Veronica Smith", maxLines: 1, style: TextStyle(
                  fontFamily: "Kumbhsans",
                  overflow: TextOverflow.ellipsis,
                  color: Color(0xFFFFFFFF),
                  fontSize: 16,
                  height: 1,
                  fontWeight: FontWeight.w800
                )),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0x0AFF8412)
                      ),
                      child:const Text("Call Doctor Directly", style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: Color(0xFFFFA048),
                        fontSize: 10,
                        fontWeight: FontWeight.w800
                      )) ,
                    ),
                    const SizedBox(width: 4,),
                    const ImageIcon(AssetImage("res/icons/sqrillnav.png"), size: 34, color: Color(0xFFFFFFFF)),
                  ],
                )
              ],
            ),
          ),

          const SizedBox(width: 10,),

          const CircleAvatar(
            backgroundColor: Color(0xFFFF8412),
            child: Icon(Icons.phone, color: Color(0xFFF9F9F9), size: 20,),
          ),

          const SizedBox(width: 10,),

          GestureDetector(
            onTap: ()=> Get.toNamed(Routes.payment),
            child: Container(
              width: 120,
              height: 45,
              margin: const EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: const Color(0xFFFF8412)
              ),
              alignment: Alignment.center,
              child: const Stack(
                alignment: Alignment.center,
                children: [
                  Text("Book Now", style: TextStyle(
                    fontFamily: "Kumbhsans",
                    color: Color(0xFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w700
                  )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 14, bottom: 14),
                      child: ImageIcon(AssetImage("res/icons/blink.png"), size: 10, color: Color(0xFFFFFFFF),)))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}