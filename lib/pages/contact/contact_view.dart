import 'package:dentist_india_plus/extensions%20copy/number_exten.dart';
import 'package:dentist_india_plus/extensions%20copy/string_exten.dart';
import 'package:flutter/material.dart';

import '../../constants/assets_const.dart';
import '../../constants/colors_const.dart';
import '../../widgets/contact_form.dart';
import '../../widgets/custom_appbar3.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  
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
                      child: "CONTACT US".bold(fontSize: 24)
                    )
                  ],
                ),
              ],
            ),
          ),

          8.h(),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Contact us!".extrabold(fontSize: 20, color: ColorsConst.text),
                4.h(),
                "First Health and Technology Services".semibold(fontSize: 13, color: ColorsConst.text)
              ],
            ),  
          ),
          10.h(),

          const ContactForm(),
          
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
            
                Positioned(
                  right: -50,
                  bottom: -50,
                  child: Image.asset(AssetsConst.logo, width: 200, height: 200, color: ColorsConst.primary.withOpacity(0.05),)),
            
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: Row(
                        children: [
                          "Made with love in India".semibold(fontSize: 14, color: ColorsConst.textLight),
                          12.w(),
                          Image.asset(AssetsConst.flag, width: 18, height: 12)
                        ],
                      ),
                    ),
                
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
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
                    ),
                  ],
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}