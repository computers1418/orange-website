import 'dart:math';

import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:dentist_india_plus/widgets/gradient_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InnerItem extends StatelessWidget {
  final Map item;
  final double value;

  const InnerItem({super.key, required this.item, required this.value});

  @override
  Widget build(BuildContext context) {

    return Align(
          alignment: item["left"] ? Alignment.centerLeft : Alignment.centerRight ,
          child: Transform.translate(
            offset: item["translate"]>0 ? Offset.fromDirection(1.4, item["translate"]) : const Offset(0, 0),
            child: Transform.rotate(
              // angle: 12 * pi / 180,
              angle: (item['angle']* value) * pi / 180,
                child: Container(
                  width: MediaQuery.of(context).size.width/2.5,
                  height: (MediaQuery.of(context).size.height/4.5),
                padding: EdgeInsets.fromLTRB(8, item["full"] ? 0 :8, 8, 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(28)
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(32, item["full"] ? 0 :12, 32, 12),
                        child: Image.asset(item["image"])),
                    ),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 18),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: const Color(0xFFF2F7FB)
                          ),
                          alignment: Alignment.center,
                          child: Text(item["label"], style: TextStyle(
                            fontFamily: "KumbhsansSemiBold",
                            color: const Color(0xFF2B275A),
                            fontSize: TextResponsive.getResponsiveFontSize(context, 13),
                            fontWeight: FontWeight.w800
                          )),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xFF2B275A)
                            ),
                            child: const GradientText(text: "Rs. 5,000"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
    );
  }
}