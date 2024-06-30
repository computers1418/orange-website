import 'package:dentist_india_plus/extensions%20copy/number_exten.dart';
import 'package:dentist_india_plus/extensions%20copy/string_exten.dart';
import 'package:flutter/material.dart';

import '../../constants/assets_const.dart';
import '../../constants/colors_const.dart';
import '../../constants/data_const.dart';
import '../../widgets/custom_appbar3.dart';

class TermsView extends StatefulWidget {
  const TermsView({super.key});

  @override
  State<TermsView> createState() => _TermsViewState();
}

class _TermsViewState extends State<TermsView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AssetsConst.pattern))
            ),
            child: Column(
              children: [
                const CustomAppBar3(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(26, 0, 26, 30),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child: Image.asset(AssetsConst.terms, width: 24, height: 24,),
                      ),
                      10.w(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "TERMS OF SERVICE".bold(fontSize: 18),
                          "Last updated on 25 May, 2024".medium(fontSize: 10, color: Colors.white.withOpacity(0.8))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "1. Terms".bold(fontSize: 20, color: ColorsConst.text),
                  8.h(),
                  DataConst.content.regular(fontSize: 12, color: ColorsConst.textLight),
                  10.h(),
              
                  "2. Licensing".bold(fontSize: 20, color: ColorsConst.text),
                  8.h(),
                  DataConst.content.regular(fontSize: 12, color: ColorsConst.textLight),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [

                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorsConst.disable, width: 2
                      ),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    alignment: Alignment.center,
                    child: "DECLINE".semibold(fontSize: 18, color: ColorsConst.disable),
                  ),
                ),
                16.w(),
                Expanded(
                  child: Container(
                    height: 40,
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
                          child: "ACCEPT".semibold(fontSize: 18),  
                        ),
                      ],
                    ),
                  ),
                )


              ],
            ),
          )
        ],
      ),
    );
  }
}