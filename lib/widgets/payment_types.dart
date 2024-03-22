import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';

class PaymentTypes extends StatelessWidget {
  const PaymentTypes({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: SizeResponsive.get(context, height>700 ? 66: 56), width: SizeResponsive.get(context, height>700 ? 66: 56),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(width: 1, color: const Color(0x2BFFFFFF))
                ),
                child: const ImageIcon(AssetImage("res/icons/payment4.png"), size: 16, color: Colors.black,),
              ),
              const SizedBox(height: 12,),
              Text("Cash", style: TextStyle(
                fontFamily: "Kumbhsans",
                color: const Color(0xFFFFFFFF),
                fontSize: TextResponsive.getResponsiveFontSize(context, 12),
                height: 1,
                fontWeight: FontWeight.w800
              ))
            ],
          ),
          Column(
            children: [
              Container(
                height: SizeResponsive.get(context, height>700 ? 66: 56), width: SizeResponsive.get(context, height>700 ? 66: 56),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0x1AFFFFFF),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(width: 1, color: const Color(0x2BFFFFFF))
                ),
                child: const ImageIcon(AssetImage("res/icons/payment1.png"), size: 20, color: Colors.white,),
              ),
              const SizedBox(height: 8,),
               Text("UPI", style: TextStyle(
                fontFamily: "Kumbhsans",
                color: const Color(0xFFFFFFFF),
                fontSize: TextResponsive.getResponsiveFontSize(context, 11),
                height: 1,
                fontWeight: FontWeight.w600
              )),
              const SizedBox(height: 4,),
               Text("( Unavailable )", style: TextStyle(
                fontFamily: "Kumbhsans",
                color: const Color(0xFFFFFFFF),
                fontSize: TextResponsive.getResponsiveFontSize(context, 9),
                height: 1,
                fontWeight: FontWeight.w600
              ))
            ],
          ),
          Column(
            children: [
              Container(
                height: SizeResponsive.get(context, height>700 ? 66: 56), width: SizeResponsive.get(context, height>700 ? 66: 56),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0x1AFFFFFF),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(width: 1, color: const Color(0x2BFFFFFF))
                ),
                child: const ImageIcon(AssetImage("res/icons/payment2.png"), size: 20, color: Colors.white,),
              ),
              const SizedBox(height: 8,),
               Text("Net Banking", style: TextStyle(
                fontFamily: "Kumbhsans",
                color: const Color(0xFFFFFFFF),
                fontSize: TextResponsive.getResponsiveFontSize(context, 11),
                height: 1,
                fontWeight: FontWeight.w600
              )),
              const SizedBox(height: 4,),
               Text("( Unavailable )", style: TextStyle(
                fontFamily: "Kumbhsans",
                color: const Color(0xFFFFFFFF),
                fontSize: TextResponsive.getResponsiveFontSize(context, 9),
                height: 1,
                fontWeight: FontWeight.w600
              ))
            ],
          ),
          Column(
            children: [
              Container(
                height: SizeResponsive.get(context, height>700 ? 66: 56), width: SizeResponsive.get(context, height>700 ? 66: 56),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0x1AFFFFFF),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(width: 1, color: const Color(0x2BFFFFFF))
                ),
                child: const ImageIcon(AssetImage("res/icons/payment3.png"), size: 20, color: Colors.white,),
              ),
              const SizedBox(height: 8,),
               Text("Wallet", style: TextStyle(
                fontFamily: "Kumbhsans",
                color: const Color(0xFFFFFFFF),
                fontSize: TextResponsive.getResponsiveFontSize(context, 11),
                height: 1,
                fontWeight: FontWeight.w600
              )),
              const SizedBox(height: 4,),
               Text("( Unavailable )", style: TextStyle(
                fontFamily: "Kumbhsans",
                color: const Color(0xFFFFFFFF),
                fontSize: TextResponsive.getResponsiveFontSize(context, 9),
                height: 1,
                fontWeight: FontWeight.w600
              ))
            ],
          ),
        ],
      ),
    );
  }
}