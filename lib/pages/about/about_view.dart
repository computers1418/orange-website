import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/extensions%20copy/number_exten.dart';
import 'package:dentist_india_plus/extensions%20copy/string_exten.dart';
import 'package:flutter/material.dart';
import '../../constants/colors_const.dart';
import '../../widgets/custom_appbar3.dart';

import '../../constants/assets_const.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  
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
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: -MediaQuery.of(context).size.width/2.3,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width/3.5,
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  top: -MediaQuery.of(context).size.width/1.5,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width/2,
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Column(
                  children: [
                    const CustomAppBar3(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(26, 0, 26, 30),
                      child: "ABOUT US".bold(fontSize: 24)
                    )
                  ],
                ),
              ],
            ),
          ),

          16.h(),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset('res/images/badge_circle.png', width: 40, height: 40,),
                            6.w(),
                            const Text("60\nClinics", style: TextStyle(
                              color: Color(0xFF2B275A),
                              fontFamily: "Kumbhsans",
                              height: 1,
                              fontWeight: FontWeight.w800,
                              fontSize: 12
                            ))
                          ],
                        ),
                        10.w(),
                        Row(
                          children: [
                            Image.asset('res/images/cup_circle.png', width: 40, height: 40,),
                            6.w(),
                            const Text("1 Lakh\nPatients", style: TextStyle(
                              color: Color(0xFF2B275A),
                              fontFamily: "Kumbhsans",
                              height: 1,
                              fontWeight: FontWeight.w800,
                              fontSize: 12
                            ))
                          ],
                        ),
                        10.w(),
                        Row(
                          children: [
                            Image.asset('res/images/flower_circle.png', width: 40, height: 40,),
                            6.w(),
                            const Text("50\nCities", style: TextStyle(
                              color: Color(0xFF2B275A),
                              height: 1,
                              fontFamily: "Kumbhsans",
                              fontWeight: FontWeight.w800,
                              fontSize: 12
                            ))
                          ],
                        )
                      ],
                    ),

                    20.h(),
                    Image.asset('res/images/logo_spark.png', width: 200,),


                    16.h(),
                    Text(aboutContent.toString(), textAlign: TextAlign.center, style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: "Kumbhsans",
                      color: Color(0xFFA6A5B8)
                    )),

                    20.h(),

                    Row(
                      children: [
                        Image.asset(AssetsConst.avatar1, width: MediaQuery.of(context).size.width/2.5, height: MediaQuery.of(context).size.width/2.5,),
                        10.w(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Our Vision", style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                fontFamily: "Kumbhsans",
                                color: Color(0xFFFF8412)
                              )),
                              10.h(),
                              const Text(visionContent, style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                fontFamily: "Kumbhsans",
                                color: Color(0xFFA6A5B8)
                              )),
                            ],
                          ),
                        )
                      ],
                    ),

                    
                    30.h(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Follow us".bold(fontSize: 16, color: ColorsConst.text),
                            10.h(),
                            Row(
                              children: [
                                ...[AssetsConst.instagram, AssetsConst.twitter, AssetsConst.facebook].map((e) => 
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: ColorsConst.text,
                                      child: Image.asset(e, width: 14, height: 14),
                                    )  
                                  )
                                )
                                        
                              ],
                            ),
                            16.h()
                          ],
                        ),
                        Row(
                          children: [
                            "Made with love in India".semibold(fontSize: 14, color: ColorsConst.textLight),
                            12.w(),
                            Image.asset(AssetsConst.flag, width: 18, height: 12)
                          ],
                        ),
                      ],
                    ),

                  ],
                )
            ),
          ),

        ],
      ),
    );
  }
}