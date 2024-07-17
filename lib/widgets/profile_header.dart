import 'package:dentist_india_plus/extensions/num_exten.dart';
import 'package:dentist_india_plus/extensions/text_exten.dart';
import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.only(
      //   left: SizeResponsive.getHeightverse(context, 40),
      //   right: SizeResponsive.getHeightverse(context, 25),
      //   top: SizeResponsive.getHeightverse(context, 6),
      //   bottom: SizeResponsive.getHeightverse(context, 6),
      // ),
      padding: const EdgeInsets.only(left: 33, top: 2, bottom: 2, right: 25),
      child: Row(
        children: [
          CircleAvatar(
            radius: SizeResponsive.get(context, 32),
            backgroundImage: const AssetImage("res/images/profile.png"),
          ),
          8.hgap(),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Dr. Diana Cruz".extraBold(
                  fontSize: TextResponsive.getResponsiveFontSize(context, 20)),
              6.hgap(),
              "BDS, MDS".medium(
                  fontSize: TextResponsive.getResponsiveFontSize(context, 12))
            ],
          )),
          Column(
            children: [
              CircleAvatar(
                radius: SizeResponsive.get(context, 16),
                child: ImageIcon(const AssetImage("res/icons/heart.png"),
                    size: SizeResponsive.getHeightverse(context, 18),
                    color: const Color(0x99FF8412)),
              ),
              SizeResponsive.get(context, 14).toInt().vgap(),
              CircleAvatar(
                radius: SizeResponsive.get(context, 16),
                child: ImageIcon(const AssetImage("res/icons/phone.png"),
                    size: SizeResponsive.getHeightverse(context, 18),
                    color: const Color(0xFFFF8412)),
              )
            ],
          )
        ],
      ),
    );
  }
}
