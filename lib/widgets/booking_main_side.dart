import 'dart:math';

import 'package:dentist_india_plus/extensions/num_exten.dart';
import 'package:flutter/material.dart';

class BookingMainSide extends StatelessWidget {
  const BookingMainSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 90 * (pi / 180),
      child: Container(
        width: 200,
        height: 30,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("res/images/curved_bg.png"),
                fit: BoxFit.fill),
            boxShadow: [
              BoxShadow(
                  offset: Offset(-5, 10),
                  blurRadius: 20,
                  color: Color(0x33000000))
            ]
            // borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            // color: Color(0xFF2B275A)
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ImageIcon(
              AssetImage("res/icons/cup.png"),
              size: 10,
              color: Color(0xFFFF8412),
            ),
            4.hgap(),
            const Text(
              "50 Cities",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
            12.hgap(),
            const ImageIcon(
              AssetImage("res/icons/badge.png"),
              size: 10,
              color: Color(0xFFFF8412),
            ),
            4.hgap(),
            const Text(
              "60 Clinics",
              style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
