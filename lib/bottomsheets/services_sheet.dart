import 'dart:ui';

import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_close.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_header.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_nav.dart';
import 'package:dentist_india_plus/widgets/service_item.dart';
import 'package:flutter/material.dart';

import '../widgets/notch.dart';

class ServicesSheet extends StatelessWidget {
  final ValueChanged onChanged;
  const ServicesSheet({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    ValueNotifier notifier  = ValueNotifier(null);

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
            title2: "SERVICES", 
            sub: "Choose service from the options below"
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
                child: ValueListenableBuilder(
                  valueListenable: notifier,
                  builder: (_, val, __) {
                    return Column(
                      children: [
                        ...services.map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ServiceItem(
                              icon: e["icon"]!, 
                              service: e["service"]!,
                              amount: e["amount"],
                              selected: val==e["service"],
                              onClick: (){
                                notifier.value = e["service"];
                                onChanged(e["service"]);
                              },
                            ),
                          )),
                        Visibility(
                          visible: height>600,
                          child: const SizedBox(height: 6,)),
                        const BottomsheetNav()
                      ],
                    );
                  }
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