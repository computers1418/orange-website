
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarCarousel extends StatefulWidget {
  Function(DateTime) function;

  CalendarCarousel({super.key, required this.function});

  @override
  State<CalendarCarousel> createState() => _CalendarCarouselState();
}

class _CalendarCarouselState extends State<CalendarCarousel> {
  int _currentIndex = 0;
  DateTime startDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: CarouselSliderController(),
      options: CarouselOptions(
        viewportFraction: 0.25,
        initialPage: _currentIndex,
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;

            widget.function(DateTime.now().add(Duration(days: index)));
          });
        },
      ),
      items: List.generate(500, (index) => index).map((e) {
        DateTime date;
        DateTime _date = startDate.add(Duration(days: e));
        date = new DateTime(_date.year, _date.month, _date.day);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(new DateFormat("MMM", "en_US").format(date).toUpperCase(),
                    style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: _currentIndex != e
                            ? const Color(0x332B275A)
                            : const Color(0xFF2B275A),
                        fontSize:
                            TextResponsive.getResponsiveFontSize(context, 14),
                        height: 1,
                        fontWeight: FontWeight.w800)),
                const SizedBox(
                  height: 4,
                ),
                Text(date.day.toString(),
                    style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: _currentIndex != e
                            ? const Color(0x332B275A)
                            : const Color(0xFF2B275A),
                        fontSize:
                            TextResponsive.getResponsiveFontSize(context, 40),
                        height: 1,
                        fontWeight: FontWeight.w800)),
                const SizedBox(
                  height: 4,
                ),
                Text(new DateFormat("E", "en_US").format(date).toUpperCase(),
                    style: TextStyle(
                        fontFamily: "Kumbhsans",
                        color: _currentIndex != e
                            ? const Color(0x332B275A)
                            : const Color(0xFF2B275A),
                        fontSize:
                            TextResponsive.getResponsiveFontSize(context, 14),
                        height: 1,
                        fontWeight: FontWeight.w800))
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}
