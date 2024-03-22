import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';

import 'separator.dart';

class BillingInfo extends StatelessWidget {
  const BillingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: SizeResponsive.get(context, 2)),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical:height> 800 ? 16: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(SizeResponsive.get(context, 25)))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text:  TextSpan(
              children: [
                TextSpan(text:"BILLING", style: TextStyle(
                  fontFamily: "KumbhsansBold",
                  fontWeight: FontWeight.w900,
                  fontSize: TextResponsive.getResponsiveFontSize(context, 14),
                  height: 1,
                  color: const Color(0xFFFFAD61 )
                )),
                
                TextSpan(text:" DETAILS", style: TextStyle(
                  fontFamily: "KumbhsansBold",
                  fontWeight: FontWeight.w900,
                  fontSize: TextResponsive.getResponsiveFontSize(context, 14),
                  color: const Color(0xFF2B275A)
                ))
              ]
            )
          ),
           SizedBox(height: height> 800 ? 12: 6,),
          ...billing.map((e)=>
            Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${e['name']}", style:  TextStyle(
                      fontFamily: "Kumbhsans",
                      color: const Color(0x992B275A),
                      fontSize: TextResponsive.getResponsiveFontSize(context, 10),
                      height: 1,
                      fontWeight: FontWeight.w500
                    )),
                  Text("${e['value']}", style:  TextStyle(
                      fontFamily: "Kumbhsans",
                      color: const Color(0xFF2B275A),
                      fontSize: TextResponsive.getResponsiveFontSize(context, 10),
                      height: 1,
                      fontWeight: FontWeight.w900
                    )),
                ],
              ),
            )
          ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                       Text("Coupons", style: TextStyle(
                          fontFamily: "Kumbhsans",
                          color: const Color(0xFF2B275A),
                          fontSize: TextResponsive.getResponsiveFontSize(context, 10),
                          height: 1,
                          fontWeight: FontWeight.w900
                        )),
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        decoration: BoxDecoration(
                          color: const Color(0x21FF8412),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child:  Row(
                          children: [
                            Text("Health100", style: TextStyle(
                              fontFamily: "Kumbhsans",
                              color: const Color(0xFFFF8412),
                              fontSize: TextResponsive.getResponsiveFontSize(context, 10),
                              height: 1,
                              fontWeight: FontWeight.w900
                            )),
                            const Icon(Icons.close, color: Color(0xFF2B275A), size: 12,)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        decoration: BoxDecoration(
                          color: const Color(0x21FF8412),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child:  Row(
                          children: [
                            Text("Consult100", style: TextStyle(
                              fontFamily: "Kumbhsans",
                              color: const Color(0xFFFF8412),
                              fontSize: TextResponsive.getResponsiveFontSize(context, 10),
                              height: 1,
                              fontWeight: FontWeight.w900
                            )),
                            const Icon(Icons.close, color: Color(0xFF2B275A), size: 12,)
                          ],
                        ),
                      ),
                    ],
                  ),
                   Text("- Rs. 200", style: TextStyle(
                      fontFamily: "Kumbhsans",
                      color: const Color(0xFFFF5151),
                      fontSize: TextResponsive.getResponsiveFontSize(context, 10),
                      height: 1,
                      fontWeight: FontWeight.w900
                    )),
                ],
              ),
           SizedBox(height: SizeResponsive.get(context, height> 800 ? 12: 6),),
          const Separator(color: Colors.grey),
           SizedBox(height: SizeResponsive.get(context, height> 800 ? 12: 6),),
           Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payable Amount", style: TextStyle(
                      fontFamily: "Kumbhsans",
                      color: const Color(0xFF2B275A),
                      fontSize: TextResponsive.getResponsiveFontSize(context, 12),
                      height: 1,
                      fontWeight: FontWeight.w900
                    )),
                  Text("Rs. 1000", style: TextStyle(
                      fontFamily: "Kumbhsans",
                      color: const Color(0xFF2B275A),
                      fontSize: TextResponsive.getResponsiveFontSize(context, 12),
                      height: 1,
                      fontWeight: FontWeight.w900
                    )),
                ],
              ),
          
        ],
      ),
    );
  }
}