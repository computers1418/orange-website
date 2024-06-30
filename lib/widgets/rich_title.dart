import 'package:flutter/material.dart';

import '../constants/colors_const.dart';

class RichTitle extends StatelessWidget {
  const RichTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          
          children: [
            TextSpan(
              text: "Feeling",
              style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w900, color: ColorsConst.text
              ),
            ),
            TextSpan(
              text: " Amazing ",
              style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w900, color: ColorsConst.primary
              ),
            ),
            TextSpan(
              text: "About Your Dental Health",
              style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w900, color: ColorsConst.text
              ),
            ),
          ]
        )),
    );
  }
}