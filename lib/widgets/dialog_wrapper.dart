import 'dart:ui';

import 'package:dentist_india_plus/widgets/app_info.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_close.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogWrapper extends StatelessWidget {
  final Widget child1;
  final Widget child2;
  final String title1;
  final String title2;
  final String sub;
  final double? bottomMargin;
  final VoidCallback onSubmit;
  const DialogWrapper({super.key, this.bottomMargin, required this.child1, required this.child2, required this.onSubmit, required this.sub, required this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Image.asset("res/images/strip2.png", height: MediaQuery.of(context).size.height,)),
          
          Padding(
            padding: EdgeInsets.only(bottom: bottomMargin ?? 230),
            child: BottomsheetHeader(
              title1: title1, 
              title2: title2,
              sub: sub,
              fontSize: 10,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 70,),
              Expanded(child: Container(),),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 0), blurRadius: 30, color: Color(0x1a000000)
                    )
                  ]
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      
                    child1,
                    
                    Row(
                      children: [
                        Expanded(
                          child: child2,
                        ),
                        const SizedBox(width: 20,),
                        GestureDetector(
                          onTap: onSubmit,
                          child: Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xFFFF8412)
                            ),
                            child: const Text("SUBMIT", style: TextStyle(
                                fontFamily: "KumbhsansSemiBold",
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w800
                              )),
                          ),
                        )
                      ],
                    )
                      
                  ],
                ),
              ),
              const Expanded(child: BottomsheetClose()),

              const SizedBox(
                height: 70,
                child: AppInfo())
            ],
          ),
        ],
      ),
    );
  }
}