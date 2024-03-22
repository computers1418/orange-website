import 'package:dentist_india_plus/extensions/num_exten.dart';
import 'package:dentist_india_plus/extensions/text_exten.dart';
import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:flutter/material.dart';

import '../responsive/text_responsive.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier indexNotifier = ValueNotifier(0);
    var height = MediaQuery.of(context).size.height;

    return  DefaultTabController(
      length: 3,
      child: Padding(
        padding: EdgeInsets.only(left: 28, top: height>800 ? 20: 0),
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
                  fontSize: height>700 ? 18 : TextResponsive.getResponsiveFontSize(context, 16),
                  fontFamily: "Kumbhsans",
                  fontWeight: FontWeight.w700
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
                onTap: (v){
                  indexNotifier.value = v;
                },
                unselectedLabelStyle: TextStyle(
                  color: const Color(0x332B275A),
                  fontSize: height>700 ? 18 :  TextResponsive.getResponsiveFontSize(context, 16),
                  fontFamily: "Kumbhsans",
                  fontWeight: FontWeight.w500
                ),
                tabs: const [
                Tab(text: "About" ),
                Tab(text: "Education"),
                Tab(text: "Specialization") ]),
             ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 16, top: 6),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. consectetur adipiscing elit. Nunc vulputate libero et velit interdum. Class aptent".medium(fontSize: height>700 ? 16 : TextResponsive.getResponsiveFontSize(context, 10), color: const Color(0x802B275A))
                      ],
                    ),
                    "Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. consectetur adipiscing elit. Nunc vulputate libero et velit interdum. Class aptent".medium(fontSize: height>700 ? 16 :TextResponsive.getResponsiveFontSize(context, 10), color: const Color(0x802B275A)),
                    "Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. consectetur adipiscing elit. Nunc vulputate libero et velit interdum. Class aptent".medium(fontSize: height>700 ? 16 :TextResponsive.getResponsiveFontSize(context, 10), color: const Color(0x802B275A))
                  ]),
              ),
            ),
            SizeResponsive.get(context, 12).toInt().vgap(),
            ValueListenableBuilder(
              valueListenable: indexNotifier,
              builder: (_, val, __) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [0, 1, 2, 3].map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: CircleAvatar(
                        radius: 3,
                        backgroundColor: val==e ? const Color(0xFFFF8412) : const Color(0x1AFF8412),
                      ),
                    )
                  ).toList(),
                );
              }
            ),
            SizeResponsive.get(context, 8).toInt().vgap(),
          ],
        ),
      ),
    );
  }
}