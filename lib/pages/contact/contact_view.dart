import 'package:dentist_india_plus/extensions%20copy/context_exten.dart';
import 'package:dentist_india_plus/extensions%20copy/number_exten.dart';
import 'package:dentist_india_plus/extensions%20copy/string_exten.dart';
import 'package:dentist_india_plus/routes/app_routes.dart';
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
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                        child: "CONTACT US".bold(fontSize: 24))
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
                2.h(),
                "Happy Teeth, Happy You"
                    .semibold(fontSize: 13, color: ColorsConst.text)
              ],
            ),
          ),
          10.h(),
          const ContactForm(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: GestureDetector(
                        onTap: () => context.goto('/'),
                        child: Row(
                          children: [
                            "Home".bold(fontSize: 12, color: ColorsConst.text),
                            4.w(),
                            const Icon(Icons.arrow_forward_outlined,
                                color: ColorsConst.text, size: 10),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: GestureDetector(
                        onTap: () => context.goto(Routes.terms),
                        child: Row(
                          children: [
                            "Terms of service"
                                .bold(fontSize: 12, color: ColorsConst.text),
                            4.w(),
                            const Icon(Icons.arrow_forward_outlined,
                                color: ColorsConst.text, size: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: GestureDetector(
                        onTap: () => context.goto(Routes.about),
                        child: Row(
                          children: [
                            "About Us"
                                .bold(fontSize: 12, color: ColorsConst.text),
                            4.w(),
                            const Icon(Icons.arrow_forward_outlined,
                                color: ColorsConst.text, size: 10),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: GestureDetector(
                        onTap: () => context.goto(Routes.refund),
                        child: Row(
                          children: [
                            "Refund Policy"
                                .bold(fontSize: 12, color: ColorsConst.text),
                            4.w(),
                            const Icon(Icons.arrow_forward_outlined,
                                color: ColorsConst.text, size: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => setState(() => show = !show),
                            child: Row(
                              children: [
                                "Mailing Address".bold(
                                    fontSize: 12, color: ColorsConst.text),
                                4.w(),
                                const Icon(Icons.arrow_forward_outlined,
                                    color: ColorsConst.text, size: 10),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Visibility(
                              visible: show,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "M/s First Health and Technology Services "
                                      .regular(fontSize: 9, color: Colors.grey),
                                  4.h(),
                                  "Email - support@dentistindiaplus.com"
                                      .regular(fontSize: 9, color: Colors.grey),
                                  4.h(),
                                  "Ph - +91 99106 55367 "
                                      .regular(fontSize: 9, color: Colors.grey),
                                  4.h(),
                                  "New Delhi Address - 9/329A, 3rd Floor, Om Nivas, Lalita Park, Laxmi Nagar, New Delhi - 110092 INDIA "
                                      .regular(fontSize: 9, color: Colors.grey),
                                  4.h(),
                                  "Bangalore Office - 811, 10th A Main, Suite No.- 417, 1st Floor, Indira Nagar, Bengaluru - 560038 INDIA "
                                      .regular(fontSize: 9, color: Colors.grey)
                                ],
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: GestureDetector(
                        onTap: () => context.goto(Routes.privacy),
                        child: Row(
                          children: [
                            "Privacy Policy"
                                .bold(fontSize: 12, color: ColorsConst.text),
                            4.w(),
                            const Icon(Icons.arrow_forward_outlined,
                                color: ColorsConst.text, size: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                  right: -50,
                  bottom: -50,
                  child: Image.asset(
                    AssetsConst.logo,
                    width: 200,
                    height: 200,
                    color: ColorsConst.primary.withOpacity(0.05),
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Row(
                      children: [
                        "Made with love in India".semibold(
                            fontSize: 14, color: ColorsConst.textLight),
                        12.w(),
                        Image.asset(AssetsConst.flag, width: 18, height: 12)
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Follow us".bold(fontSize: 16, color: ColorsConst.text),
                        10.h(),
                        Row(
                          children: [
                            ...[
                              AssetsConst.instagram,
                              AssetsConst.twitter,
                              AssetsConst.facebook
                            ].map((e) => Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: ColorsConst.text,
                                  child: Image.asset(e, width: 14, height: 14),
                                )))
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
        ],
      ),
    );
  }
}
