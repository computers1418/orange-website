import 'package:flutter/material.dart';

extension TextExtension on String {

  black({Color? color, required double fontSize})=>Text(this, style: TextStyle(
    fontSize: fontSize, fontWeight: FontWeight.w900, color: color ?? Colors.white
  ));

  bold({Color? color, required double fontSize})=>Text(this, style: TextStyle(
    fontSize: fontSize, fontWeight: FontWeight.w700, color: color ?? Colors.white
  ));

  extrabold({Color? color, required double fontSize})=>Text(this, style: TextStyle(
    fontSize: fontSize, fontWeight: FontWeight.w800, color: color ?? Colors.white
  ));

  medium({Color? color, required double fontSize})=>Text(this, style: TextStyle(
    fontSize: fontSize, fontWeight: FontWeight.w500, color: color ?? Colors.white
  ));

  regular({Color? color, required double fontSize})=>Text(this, style: TextStyle(
    fontSize: fontSize, fontWeight: FontWeight.w400, color: color ?? Colors.white
  ));

  regularCenter({Color? color, required double fontSize})=>Text(this, textAlign: TextAlign.center, style: TextStyle(
    fontSize: fontSize, fontWeight: FontWeight.w400, color: color ?? Colors.white
  ));

  semibold({Color? color, required double fontSize})=>Text(this, style: TextStyle(
    fontSize: fontSize, fontWeight: FontWeight.w600, color: color ?? Colors.white
  ));

}