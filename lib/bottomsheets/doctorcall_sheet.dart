import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:dentist_india_plus/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorCallSheet extends StatelessWidget {
  final String name;
  const DoctorCallSheet({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: ()=>{Navigator.pop(context)},
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
            decoration: const BoxDecoration(
                color: Color(0xFF2B275A),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(name,
                          maxLines: 1,
                          style: TextStyle(
                              fontFamily: "Kumbhsans",
                              overflow: TextOverflow.ellipsis,
                              color: const Color(0xFFFFFFFF),
                              fontSize: TextResponsive.getResponsiveFontSize(
                                  context, 18),
                              height: 1,
                              fontWeight: FontWeight.w800)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Color(0x0AFF8412)),
                            child: Text("Call Doctor Directly",
                                style: TextStyle(
                                    fontFamily: "Kumbhsans",
                                    color: const Color(0xFFFFA048),
                                    fontSize:
                                        TextResponsive.getResponsiveFontSize(
                                            context, 12),
                                    fontWeight: FontWeight.w800)),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          ImageIcon(
                              const AssetImage("res/images/sqrillnav.png"),
                              size: TextResponsive.getResponsiveFontSize(
                                  context, 34),
                              color: const Color(0xFFFFFFFF)),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: SizeResponsive.get(context, 10),
                ),
                const CircleAvatar(
                  backgroundColor: Color(0xFFFF8412),
                  child: Icon(
                    Icons.phone,
                    color: Color(0xFFF9F9F9),
                    size: 20,
                  ),
                ),
                SizedBox(width: SizeResponsive.get(context, 10)),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.payment),
                  child: Container(
                    width: SizeResponsive.get(context, 140),
                    height: SizeResponsive.get(context, 45),
                    margin: const EdgeInsets.only(bottom: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: const Color(0xFFFF8412),
                    ),
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Text(
                          "Book Now",
                          style: TextStyle(
                            fontFamily: "Kumbhsans",
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: SizeResponsive.get(context, 12),
                              bottom: 14,
                            ),
                            child: const ImageIcon(
                              AssetImage("res/icons/star.png"),
                              size: 10,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 80,
            child: GestureDetector(
              onTap: () => Get.toNamed(Routes.location),
              child: Image.asset(
                'res/images/clinic_map.png',
                width: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
