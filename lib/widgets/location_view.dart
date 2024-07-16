import 'package:dentist_india_plus/extensions%20copy/number_exten.dart';
import 'package:dentist_india_plus/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../responsive/text_responsive.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("res/images/location_frame.png"),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            CustomAppBar(
              onMenuClick: () {},
              onClose: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage("res/images/direction.png"),
                      ),
                    ),
                    15.h(),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF2B275A),
                          borderRadius: BorderRadius.circular(35)),
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: 97,
                            height: 93,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: AssetImage("res/images/loc.png"),
                                    fit: BoxFit.cover)),
                          ),
                          15.w(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dr. Rajeev Shukla",
                                  style: TextStyle(
                                    fontFamily: "Kumbhsans",
                                    color: const Color(0xFFFFA048),
                                    fontSize:
                                        TextResponsive.getResponsiveFontSize(
                                            context, 15),
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                4.h(),
                                Text(
                                  "Dental Clinic",
                                  style: TextStyle(
                                    fontFamily: "Kumbhsans",
                                    color: const Color(0xFFFFFFFF),
                                    fontSize:
                                        TextResponsive.getResponsiveFontSize(
                                            context, 11),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                2.h(),
                                Text(
                                  "12/2, Mathura Road, Sector 37, Faridabad - Delhi",
                                  style: TextStyle(
                                    fontFamily: "Kumbhsans",
                                    color: const Color(0xFFFFFFFF)
                                        .withOpacity(0.6),
                                    fontSize:
                                        TextResponsive.getResponsiveFontSize(
                                            context, 10),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                8.h(),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.room,
                                      color: Color(0xFFFF8412),
                                      size: 12,
                                    ),
                                    2.w(),
                                    Text(
                                      "1.67 Km",
                                      style: TextStyle(
                                        fontFamily: "Kumbhsans",
                                        color: const Color(0xFFFFFFFF),
                                        fontSize: TextResponsive
                                            .getResponsiveFontSize(context, 10),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              const CircleAvatar(
                                radius: 22,
                                backgroundImage: AssetImage(
                                  "res/images/whatsapp_orange.png",
                                ),
                              ),
                              9.h(),
                              const CircleAvatar(
                                radius: 22,
                                backgroundImage: AssetImage(
                                  "res/images/phone_orange.png",
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
