import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/extensions%20copy/number_exten.dart';
import 'package:dentist_india_plus/extensions%20copy/string_exten.dart';
import 'package:flutter/material.dart';

import '../../constants/assets_const.dart';
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
                    fit: BoxFit.fill, image: AssetImage(AssetsConst.pattern))),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: -MediaQuery.of(context).size.width / 2.3,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width / 3.5,
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  top: -MediaQuery.of(context).size.width / 1.5,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width / 2,
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Column(
                  children: [
                    const CustomAppBar3(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(26, 0, 26, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              AssetsConst.terms,
                              width: 24,
                              height: 24,
                            ),
                          ),
                          10.w(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "TERMS OF SERVICE".bold(fontSize: 18),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            //  Column(
            //   children: [
            //     const CustomAppBar3(),
            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(26, 0, 26, 30),
            //       child: Row(
            //         children: [
            //           CircleAvatar(
            //             radius: 24,
            //             backgroundColor: Colors.white,
            //             child: Image.asset(AssetsConst.terms, width: 24, height: 24,),
            //           ),
            //           10.w(),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               "TERMS OF SERVICE".bold(fontSize: 18),
            //             ],
            //           )
            //         ],
            //       ),
            //     )
            //   ],
            // ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                ...termsContent.keys.map((e) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              fontFamily: "Kumbhsans",
                              color: Color(0xFF2B275A))),
                      16.h(),
                      Text(termsContent[e].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              fontFamily: "Kumbhsans",
                              color: Color(0xFFA6A5B8)))
                    ],
                  );
                }),
                30.h(),
                const Text(
                  "Dentist India Plus ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: "Kumbhsans",
                    color: Color(0xFFA6A5B8),
                  ),
                ),
                const Text(
                  "M/s First Health and Technology",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: "Kumbhsans",
                    color: Color(0xFFA6A5B8),
                  ),
                ),
                const Text(
                  "Services",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: "Kumbhsans",
                    color: Color(0xFFA6A5B8),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
