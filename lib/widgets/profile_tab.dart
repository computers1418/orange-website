import 'dart:ui';

import 'package:dentist_india_plus/extensions/num_exten.dart';
import 'package:dentist_india_plus/extensions/text_exten.dart';
import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/widgets/bottomsheet_close.dart';
import 'package:flutter/material.dart';

import '../responsive/text_responsive.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier indexNotifier = ValueNotifier(0);
    var height = MediaQuery.of(context).size.height;

    String aboutUsText =
        "Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. consectetur adipiscing elit. Nunc vulputate libero et velit interdum Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. consectetur adipi"
            .substring(0, MediaQuery.of(context).size.height > 700 ? 280 : 150);

    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: EdgeInsets.only(
          left: 28,
          top: height > 800 ? 20 : 0,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: SizeResponsive.get(context, 40),
              child: TabBar(
                padding: EdgeInsets.zero,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                indicatorPadding: EdgeInsets.zero,
                labelStyle: TextStyle(
                  color: const Color(0xFF2B275A),
                  fontSize: height > 700
                      ? 16
                      : TextResponsive.getResponsiveFontSize(context, 18),
                  fontFamily: "Kumbhsans",
                  fontWeight: FontWeight.w700,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                // indicatorColor: Color(0xFFFF8412),

                dividerColor: Colors.transparent,
                indicatorWeight: 0,
                indicator: const UnderlineTabIndicator(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(width: 3.0, color: Color(0xFFFF8412)),
                  insets: EdgeInsets.symmetric(horizontal: 16.0),
                ),
                onTap: (v) {
                  indexNotifier.value = v;
                },
                unselectedLabelStyle: TextStyle(
                  color: const Color(0x332B275A),
                  fontSize: height > 700
                      ? 16
                      : TextResponsive.getResponsiveFontSize(context, 18),
                  fontFamily: "Kumbhsans",
                  fontWeight: FontWeight.w500,
                ),
                tabs: const [
                  Tab(text: "About"),
                  Tab(text: "Education"),
                  Tab(text: "Specialization")
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 6,
                  right: 16,
                ),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: aboutUsText,
                            style: TextStyle(
                              fontSize: TextResponsive.getResponsiveFontSize(
                                context,
                                12,
                              ),
                              fontFamily: "Kumbhsans",
                              color: const Color(0x802B275A),
                            ),
                            children: [
                              WidgetSpan(
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) =>
                                          const AboutOverLayDialog(),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      // vertical: 1,
                                      horizontal: 4,
                                    ),
                                    child: Text(
                                      "more...",
                                      style: TextStyle(
                                        color: const Color(0xFF2B275A),
                                        fontSize: TextResponsive
                                            .getResponsiveFontSize(
                                          context,
                                          12,
                                        ),
                                        fontFamily: "Kumbhsans",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // TextSpan(
                              //   text: " more...",
                              //   style: TextStyle(
                              //     color: const Color(0xFF2B275A),
                              //     fontSize:
                              //         TextResponsive.getResponsiveFontSize(
                              //       context,
                              //       12,
                              //     ),
                              //     fontFamily: "Kumbhsans",
                              //     fontWeight: FontWeight.w700,
                              //   ),
                              //   recognizer: TapGestureRecognizer()
                              //     ..onTap = () {
                              //       showDialog(
                              //         context: context,
                              //         builder: (_) =>
                              //             const AboutOverLayDialog(),
                              //       );
                              //     },
                              // )
                            ],
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines:
                              MediaQuery.of(context).size.height > 700 ? 5 : 3,
                        ),
                      ],
                    ),
                    "Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. consectetur adipiscing elit. Nunc vulputate libero et velit interdum. Class aptent"
                        .medium(
                      fontSize:
                          TextResponsive.getResponsiveFontSize(context, 12),
                      color: const Color(0x802B275A),
                    ),
                    "Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. consectetur adipiscing elit. Nunc vulputate libero et velit interdum. Class aptent"
                        .medium(
                      fontSize:
                          TextResponsive.getResponsiveFontSize(context, 12),
                      color: const Color(0x802B275A),
                    )
                  ],
                ),
              ),
            ),
            SizeResponsive.get(context, 12).toInt().vgap(),
            ValueListenableBuilder(
                valueListenable: indexNotifier,
                builder: (_, val, __) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [0, 1, 2, 3]
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: val == e
                                    ? const Color(0xFFFF8412)
                                    : const Color(0x1AFF8412),
                              ),
                            ))
                        .toList(),
                  );
                }),
            SizeResponsive.get(context, 8).toInt().vgap(),
          ],
        ),
      ),
    );
  }
}

class AboutOverLayDialog extends StatefulWidget {
  const AboutOverLayDialog({super.key});

  @override
  State<AboutOverLayDialog> createState() => _AboutOverLayDialogState();
}

class _AboutOverLayDialogState extends State<AboutOverLayDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      content: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2B275A).withOpacity(0.7),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: TextResponsive.getResponsiveFontSize(context, 25),
            ),
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                100.vgap(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xff2B275A),
                      ),
                    ),
                    Text(
                      "ABOUT",
                      style: TextStyle(
                        fontFamily: "KumbhsansBold",
                        fontWeight: FontWeight.w800,
                        fontSize:
                            TextResponsive.getResponsiveFontSize(context, 28),
                        color: const Color(0xFFFFAD61),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        TextResponsive.getResponsiveFontSize(context, 15),
                  ),
                  child: Text(
                    "Corem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.\n\n Curabitur tempor quis eros tempus lacinia. Nam bibendum pellentesque quam a convallis. Sed ut vulputate nisi. Integer in felis sed leo vestibulum venenatis. Suspendisse quis arcu sem. Aenean feugiat ex eu vestibulum vestibulum.",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Kumbhsans",
                      fontSize:
                          TextResponsive.getResponsiveFontSize(context, 16),
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const BottomsheetClose(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
