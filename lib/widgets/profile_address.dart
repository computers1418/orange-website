import 'package:dentist_india_plus/extensions/num_exten.dart';
import 'package:dentist_india_plus/extensions/text_exten.dart';
import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';

class ProfileAddress extends StatelessWidget {
  const ProfileAddress({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2B275A),
        borderRadius: BorderRadius.circular(40)
      ),
      height: SizeResponsive.get(context, 65),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("res/images/roads.png"),
              const Icon(Icons.room, color: Color(0xFFFF8412), size: 20,)
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Dental Clinic".extraBold(fontSize: TextResponsive.getResponsiveFontSize(context, 14)),
                3.vgap(),
                "12/2, Mathura Road, Sector 37, Faridabad - Delhi".medium(fontSize: height>700 ? 12: TextResponsive.getResponsiveFontSize(context, 10))
              ],
            ),
          ),
          CircleAvatar(
            radius: SizeResponsive.get(context, 16),
            backgroundColor: const Color(0xFFFF8412),
            child: Icon(Icons.arrow_forward, color: Colors.white, size: SizeResponsive.get(context, 16),),
          ),
          SizeResponsive.get(context, 16).toInt().hgap()
        ],
      ),
    );
  }
}