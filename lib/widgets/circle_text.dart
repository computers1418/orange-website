import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';

class CText extends StatelessWidget {
  const CText({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularText(
        children: [
          TextItem(
            text: Text(
              "EXPERT SERVICE".toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            space: 12,
            startAngle: -90,
            startAngleAlignment: StartAngleAlignment.center,
            direction: CircularTextDirection.clockwise,
          ),
          TextItem(
            text: Text(
              "LIMITED OFFER".toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            space: 10,
            startAngle: 90,
            startAngleAlignment: StartAngleAlignment.center,
            direction: CircularTextDirection.anticlockwise,
          ),
        ],
        radius: 95,
        position: CircularTextPosition.inside,
      );
  }
}