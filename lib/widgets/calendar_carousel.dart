import 'package:carousel_slider/carousel_slider.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:dentist_india_plus/utils.dart';
import 'package:flutter/material.dart';

class CalendarCarousel extends StatefulWidget {
  const CalendarCarousel({super.key});

  @override
  State<CalendarCarousel> createState() => _CalendarCarouselState();
}

class _CalendarCarouselState extends State<CalendarCarousel> {
  int _currentIndex = 15;

  @override
  Widget build(BuildContext context) {
    

    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 0.25,
        initialPage: 15,
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      items: List.generate(
        30, (index) => index).map((e) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(getDateFromIndex(e), style:  TextStyle(
                        fontFamily: "Kumbhsans",
                        color: _currentIndex!=e ? const Color(0x332B275A) : const Color(0xFF2B275A),
                        fontSize: TextResponsive.getResponsiveFontSize(context, 40),
                        height: 1,
                        fontWeight: FontWeight.w800
                      )),
                const SizedBox(height: 4,),
                Text(getDay(e).toUpperCase(), style:  TextStyle(
                        fontFamily: "Kumbhsans",
                        color:_currentIndex!=e ? const Color(0x332B275A) : const Color(0xFF2B275A),
                        fontSize: TextResponsive.getResponsiveFontSize(context, 14),
                        height: 1,
                        fontWeight: FontWeight.w800
                      ))
              ],
            ),
          ],
        )).toList(), );
  }
}