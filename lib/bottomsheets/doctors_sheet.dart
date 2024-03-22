import 'dart:ui';

import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_header.dart';
import 'package:dentist_india_plus/widgets/doctor_item.dart';
import 'package:flutter/material.dart';

import '../widgets/bottomsheet_close.dart';
import '../widgets/bottomsheet_nav.dart';
import '../widgets/notch.dart';

class DoctorsSheet extends StatelessWidget {
  final Function(Map) onSelected;
  final Function(Map) onView;
  const DoctorsSheet({super.key, required this.onSelected, required this.onView});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: Column(
        children: [
          const BottomsheetClose(),
          const BottomsheetHeader(
            title1: "CHOOSE", 
            title2: "DOCTORS", 
            sub: "Choose your doctor from the options below"
          ),
          const SizedBox(height: 20,),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 24),
                padding: EdgeInsets.fromLTRB(20, height<600 ? 10: 20, 20, height<600 ? 10: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(0))
                ),
                child: Column(
                  children: [
                    ...doctors.map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: DoctorItem(
                          name: e["name"]!, 
                          designation: e["designation"]!,
                          location: e["location"]!,
                          onClick: (){
                            onSelected(e);
                          },
                          onView: (){
                            Navigator.pop(context);
                            onView(e);
                          },
                        ),
                      )),
                     Visibility(
                      visible: height>600,
                      child: const SizedBox(height: 6,)),
                    const BottomsheetNav()
                  ],
                ),
              ),
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Notch(),
              ),
            ],
          )
        ],
      ),
    );
  }
}