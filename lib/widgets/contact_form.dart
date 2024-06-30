import 'package:dentist_india_plus/extensions%20copy/number_exten.dart';
import 'package:dentist_india_plus/extensions%20copy/string_exten.dart';
import 'package:flutter/material.dart';

import '../constants/assets_const.dart';
import '../constants/colors_const.dart';
import 'input_field.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB( 10, 0, 10, 0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F7FB),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputField(hintText: "Name*",),
          10.h(),
          const InputField(hintText: "Email*",),
          10.h(),
          const InputField(hintText: "Subject",),
          10.h(),
          const InputField(hintText: "Message", multiline: true,),
          10.h(),
          Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
              color: ColorsConst.primary,
              border: Border.all(
                color: ColorsConst.primary, width: 2
              ),
              borderRadius: BorderRadius.circular(30)
            ),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 5,
                  right: 0,
                  child: Image.asset(AssetsConst.spark, width: 12, height: 12),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: "Send the message".semibold(fontSize: 18),  
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}