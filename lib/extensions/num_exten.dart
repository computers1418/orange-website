import 'package:flutter/material.dart';

extension NumExtension on int {

  SizedBox vgap(){
    return SizedBox(height: toDouble());
  }

  SizedBox hgap(){
    return SizedBox(width: toDouble());
  }


}