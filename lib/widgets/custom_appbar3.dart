import 'package:dentist_india_plus/extensions%20copy/context_exten.dart';
import 'package:dentist_india_plus/extensions%20copy/number_exten.dart';
import 'package:dentist_india_plus/extensions%20copy/string_exten.dart';
import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:flutter/material.dart';

import '../constants/assets_const.dart';

class CustomAppBar3 extends StatelessWidget {
  const CustomAppBar3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                children: [
                  4.h(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: SizeResponsive.get(context, 35),
                      width: SizeResponsive.get(context, 35),
                      decoration: BoxDecoration(
                        color: const Color(0x1AFFFFFF),
                        border: Border.all(color: const Color(0x0DFFFFFF)),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: const [
                          BoxShadow(blurRadius: 4, color: Color(0x1AFFFFFF))
                        ],
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.arrow_back,
                        size: SizeResponsive.get(context, 18),
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                'res/images/logo_full.png',
                width: 120,
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  "Location".medium(
                      fontSize: 6, color: Colors.white.withOpacity(0.7)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      "DL".bold(fontSize: 12),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 11,
                      )
                    ],
                  )
                ],
              ),
              16.w(),
              // InkWell(
              //   onTap: () => context.back(),
              //   child: Container(
              //     width: 44,
              //     height: 44,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(22),
              //         color: Colors.white.withOpacity(0.1),
              //         border: Border.all(
              //           color: Colors.white.withOpacity(0.05),
              //         )),
              //     alignment: Alignment.center,
              //     child:
              //         Image.asset(AssetsConst.arrowBack, width: 20, height: 20),
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}
