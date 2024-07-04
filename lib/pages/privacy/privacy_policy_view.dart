import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/extensions%20copy/number_exten.dart';
import 'package:dentist_india_plus/extensions%20copy/string_exten.dart';
import 'package:flutter/material.dart';

import '../../constants/assets_const.dart';
import '../../widgets/custom_appbar3.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  
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
                          "PRIVACY POLICY".bold(fontSize: 18),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                
                ...privacyContent.keys.map(
                  (e) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e, style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          fontFamily: "Kumbhsans",
                          color: Color(0xFF2B275A)
                        )),
                        16.h(),
                        Text(privacyContent[e].toString(), style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: "Kumbhsans",
                          color: Color(0xFFA6A5B8)
                        ))
                      ],
                    );
                  })

              ],
            ),
          ),
          
        ],
      ),
    );
  }
}