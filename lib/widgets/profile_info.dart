import 'package:dentist_india_plus/extensions/num_exten.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ImageIcon(AssetImage("res/icons/group.png"), size: 16, color: Color(0xFFFFFFFF)),
                4.hgap(),
                Text("10K\nPatients", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: height>700 ? 13 :TextResponsive.getResponsiveFontSize(context, 11),
                  height: 1.2,
                  fontFamily: "Kumbhsans"
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ImageIcon(AssetImage("res/icons/medical.png"), size: 16, color: Color(0xFFFFFFFF)),
                4.hgap(),
                Text("8+\nyear Exp", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: height>700 ? 13 :TextResponsive.getResponsiveFontSize(context, 11),
                  height: 1.2,
                  fontFamily: "Kumbhsans"
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ImageIcon(AssetImage("res/icons/message.png"), size: 16, color: Color(0xFFFFFFFF)),
                4.hgap(),
                Text("5K\nReviews", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: height>700 ? 13 :TextResponsive.getResponsiveFontSize(context, 11),
                  height: 1.2,
                  fontFamily: "Kumbhsans"
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}