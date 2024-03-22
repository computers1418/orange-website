import 'dart:ui';

import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_header.dart';
import 'package:dentist_india_plus/widgets/city_slider.dart';
import 'package:flutter/material.dart';

import 'app_info.dart';
import 'bottomsheet_close.dart';

class BottomsheetCity extends StatelessWidget {
  final VoidCallback onSelect;
  const BottomsheetCity({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {

  
    ValueNotifier<int> notifier = ValueNotifier(0);
    var height = MediaQuery.of(context).size.height;
    

    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (_, selected, __) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child:  Padding(
            padding: EdgeInsets.only(top: SizeResponsive.get(context, 60)),
            child: Column(
              children: [
                SizedBox(
                  height: SizeResponsive.get(context, 240),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset("res/images/strip2.png", width: double.infinity, fit: BoxFit.fill,),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 0),
                        child: BottomsheetHeader(
                          title1: "CHOOSE", 
                          title2: "CITY", 
                          fontSize: 10,
                          sub: "Choose your city from the options below"),
                      ),
                  
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CitySlider(
                          onSelect: onSelect,
                        ))
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: SizeResponsive.get(context, height>700 ? 200: 180),
                  margin: const EdgeInsets.symmetric(horizontal: 70),
                  decoration: BoxDecoration(
                    color: const Color(0x26FFFFFF),
                    border: Border.all(color: const Color(0x26FFFFFF)),
                    borderRadius: BorderRadius.circular(35)
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: cities.length,
                    itemBuilder: (_, idx){
                      return GestureDetector(
                        onTap: ()=>notifier.value=idx,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                            color: selected==idx ? Colors.white: null,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          alignment: Alignment.center,
                          child: Text(cities[idx], style: TextStyle(
                            fontFamily: "KumbhsansSemiBold",
                            color: selected==idx ? const Color(0xFFFF8412) : const Color(0xFFFFFFFF),
                            fontSize: TextResponsive.getResponsiveFontSize(context, 12),
                            fontWeight: selected==idx ? FontWeight.w800 :FontWeight.w500 
                          )),
                        ),
                      );
                    },
                  ),
                ),
                const Expanded(child: BottomsheetClose()),
        
                const SizedBox(
                  height: 70,
                  child: AppInfo())
              ],
            ),
          ),
        );
      }
    );
  }
}