import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';

class VisaCard extends StatelessWidget {
  const VisaCard({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.fromLTRB(16, 10, 16, SizeResponsive.get(context, 20)),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        image: DecorationImage(image: AssetImage("res/images/pancard.png"), fit: BoxFit.fill)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color(0xFF2B275A),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Text("MASTER CARD", style: TextStyle(
                  fontFamily: "Kumbhsans",
                  color: const Color(0xFFFFFFFF),
                  fontSize: TextResponsive.getResponsiveFontSize(context, 12),
                  height: 1,
                  fontWeight: FontWeight.w800
                )),
              ),
               SizedBox(
                width: SizeResponsive.get(context, 60),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        radius: SizeResponsive.get(context, 20),
                        backgroundColor: const Color(0xFFFF8514),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        radius: SizeResponsive.get(context, 20),
                        backgroundColor: const Color(0x66FFFFFF),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
           SizedBox(height: height>700 ? 30: 10,),
           Text("Card number", style: TextStyle(
              fontFamily: "Kumbhsans",
              color: const Color(0x992B275A),
              fontSize: TextResponsive.getResponsiveFontSize(context, 12),
              height: 1,
              fontWeight: FontWeight.w500
            )),
           SizedBox(height: height>700 ? 14: 4,),
           Text("2329  5551  2100  ****", style: TextStyle(
              fontFamily: "Kumbhsans",
              color: const Color(0xFF2B275A),
              fontSize: TextResponsive.getResponsiveFontSize(context, 20),
              height: 1,
              fontWeight: FontWeight.w900
            )),
           SizedBox(height: height>700 ? 30: 10,),
           Row(
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Current Balance", style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: const Color(0x992B275A),
                        fontSize: TextResponsive.getResponsiveFontSize(context, 12),
                        height: 1,
                        fontWeight: FontWeight.w500
                      )),
                    const SizedBox(height: 4,),
                    Text("Rs. 42,371.42", style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: const Color(0xFF2B275A),
                        fontSize: TextResponsive.getResponsiveFontSize(context, 22),
                        height: 1,
                        fontWeight: FontWeight.w900
                      )),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Expire", style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: const Color(0x992B275A),
                        fontSize: TextResponsive.getResponsiveFontSize(context, 12),
                        height: 1,
                        fontWeight: FontWeight.w500
                      )),
                    const SizedBox(height: 4,),
                    Text("10/27", style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: const Color(0xFF2B275A),
                        fontSize: TextResponsive.getResponsiveFontSize(context, 20),
                        height: 1,
                        fontWeight: FontWeight.w900
                      )),
                  ],
                ),
              )
            ],
          )


        ],
      ),
    );
  }
}