import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductInfo extends StatefulWidget {
  dynamic data;

  ProductInfo({super.key, this.data});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFFF8412),
            child: ImageIcon(
                const AssetImage(
                  'res/icons/tooth.png',
                ),
                size: SizeResponsive.get(context, 20),
                color: Colors.white),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Patient",
                    style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: const Color(0x992B275A),
                        fontSize: TextResponsive.getResponsiveFontSize(
                            context, height > 800 ? 12 : 10),
                        height: 1,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: SizeResponsive.get(context, 3),
                ),
                Text("Appointment ID",
                    style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: const Color(0x992B275A),
                        fontSize: TextResponsive.getResponsiveFontSize(
                            context, height > 800 ? 12 : 10),
                        height: 1,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: SizeResponsive.get(context, 3),
                ),
                Text("Service",
                    style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: const Color(0x992B275A),
                        fontSize: TextResponsive.getResponsiveFontSize(
                            context, height > 800 ? 12 : 10),
                        height: 1,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: SizeResponsive.get(context, 3),
                ),
                Text("Date & Time",
                    style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: const Color(0x992B275A),
                        fontSize: TextResponsive.getResponsiveFontSize(
                            context, height > 800 ? 12 : 10),
                        height: 1,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    widget.data[0]["name"].toString().isEmpty
                        ? "-"
                        : widget.data[0]["name"],
                    style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: const Color(0xFF2B275A),
                        fontSize: TextResponsive.getResponsiveFontSize(
                            context, height > 800 ? 12 : 10),
                        height: 1,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: SizeResponsive.get(context, 3),
                ),
                Text("DH73FH983RFDBN",
                    style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: const Color(0xFF2B275A),
                        fontSize: TextResponsive.getResponsiveFontSize(
                            context, height > 800 ? 12 : 10),
                        height: 1,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: SizeResponsive.get(context, 3),
                ),
                Text("Dental Braces",
                    style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: const Color(0xFF2B275A),
                        fontSize: TextResponsive.getResponsiveFontSize(
                            context, height > 800 ? 12 : 10),
                        height: 1,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: SizeResponsive.get(context, 3),
                ),
                Text(
                    widget.data[2]["dateTime"].toString().isEmpty
                        ? "-"
                        : widget.data[2]["dateTime"],
                    style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: const Color(0xFF2B275A),
                        fontSize: TextResponsive.getResponsiveFontSize(
                            context, height > 800 ? 12 : 10),
                        height: 1,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
