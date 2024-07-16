import 'package:flutter/material.dart';

extension TextExtension on String {
  Text bold20() {
    return Text(this,
        style: const TextStyle(
          fontFamily: "Kumbhsans",
          fontWeight: FontWeight.w800,
          fontSize: 20,
          color: Colors.white,
        ));
  }

  Text medium({
    double fontSize = 12,
    Color color = const Color(0x80FFFFFF),
    bool alignCenter = false,
  }) {
    return Text(
      this,
      textAlign: alignCenter ? TextAlign.center : null,
      maxLines: 4,
      style: TextStyle(
        fontFamily: "Kumbhsans",
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  Text extraBold({
    double fontSize = 10,
    Color color = const Color(0xFFFFFFFF),
  }) {
    return Text(this,
        style: TextStyle(
          fontFamily: "Kumbhsans",
          fontWeight: FontWeight.w800,
          fontSize: fontSize,
          color: color,
        ));
  }
}
