import 'package:dentist_india_plus/extensions/num_exten.dart';
import 'package:dentist_india_plus/extensions/text_exten.dart';
import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController(
        initialScrollOffset: MediaQuery.of(context).size.width - 100);

    var height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20),
            child: "Client Reviews".extraBold(
                color: const Color(
                  0xFF2B275A,
                ),
                fontSize: height > 700
                    ? 18
                    : TextResponsive.getResponsiveFontSize(context, 16))),
        8.vgap(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 16, left: 16),
            shrinkWrap: true,
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (_, idx) {
              bool isBlue = idx % 2 == 0;

              return Container(
                width: MediaQuery.of(context).size.width - 100,
                margin: const EdgeInsets.only(right: 6),
                padding: EdgeInsets.all(height > 700 ? 16 : 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height > 700 ? 24 : 16),
                  color: isBlue
                      ? const Color(0xFF2B275A)
                      : const Color(0xFFFF8412),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Braces as an adult? ",
                        style: TextStyle(
                          fontFamily: "Kumbhsans",
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: TextResponsive.getResponsiveFontSize(
                            context,
                            12,
                          ),
                        ),
                        children: [
                          TextSpan(
                            text:
                                "Doc Steve transformed my snaggletooth grin into a smile I can't stop showing off! Friendly clinic, clear braces, 18 months - now I'm beaming with confidence. Thank you, Dr. Steve! (P.S. My cat is adjusting.)",
                            style: TextStyle(
                              fontFamily: "Kumbhsans",
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: TextResponsive.getResponsiveFontSize(
                                context,
                                12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: SizeResponsive.get(context, 13),
                          backgroundImage:
                              const AssetImage("res/images/avatar.png"),
                        ),
                        8.hgap(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Peter Thomson".medium(
                                  fontSize: height > 700
                                      ? 10
                                      : TextResponsive.getResponsiveFontSize(
                                          context,
                                          10,
                                        ),
                                  color: Colors.white),
                              "Patients".medium(
                                fontSize: height > 700
                                    ? 6
                                    : TextResponsive.getResponsiveFontSize(
                                        context, 6),
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          "res/icons/quotes.png",
                          width: SizeResponsive.get(context, 20),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
