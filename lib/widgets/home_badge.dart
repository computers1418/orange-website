

import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/widgets/circle_text.dart';
import 'package:flutter/material.dart';

import '../responsive/text_responsive.dart';

class HomeBadge extends StatefulWidget {
  const HomeBadge({super.key});

  @override
  State<HomeBadge> createState() => _HomeBadgeState();
}

class _HomeBadgeState extends State<HomeBadge> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> header;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    header = Tween<double>(
        begin: 0,
        end: 90
      ).animate(CurvedAnimation(
        parent: _controller,
        reverseCurve: Curves.ease,
        curve: Curves.easeOut,
      ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeResponsive.get(context, 110), 
      height: SizeResponsive.get(context, 110),
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("res/images/home_badge.png"))
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text("RS. 500", style: TextStyle(
              fontFamily: "Kumbhsans",
              fontWeight: FontWeight.w900,
              fontSize: TextResponsive.getResponsiveFontSize(context, 18),
              height: 1,
              color: Colors.white
            )),
          ),
          AnimatedBuilder(
            animation: header,
            builder: (_, __){
              return RotationTransition(
                turns: TweenSequence<double>(
                  [
                    TweenSequenceItem(
                      tween: DelayTween(begin: 0.0, end: 0.25, delay: 0.5),
                      weight: 1,
                    ),
                    TweenSequenceItem(
                      tween: DelayTween(begin: 0.25, end: 0.5, delay: 0.5),
                      weight: 1,
                    ),
                    TweenSequenceItem(
                      tween: DelayTween(begin: 0.5, end: 0.75, delay: 0.5),
                      weight: 1,
                    ),
                    TweenSequenceItem(
                      tween: DelayTween(begin: 0.75, end: 1.0, delay: 0.5),
                      weight: 1,
                    ),
                  ],
                ).animate(_controller),
                child: const Stack(
                    alignment: Alignment.center,
                    children: [
                      CText(),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageIcon(AssetImage("res/icons/blink.png"), size: 8, color: Color(0xFFFFFFFF),),
                            ImageIcon(AssetImage("res/icons/blink.png"), size: 8, color: Color(0xFFFFFFFF),)
                          ],
                        ),
                      ),
                    ],
                  ),
              );
            }
          )
        ],
      ),
    );
  }
}

class DelayTween extends Tween<double> {
  final double delay;

  DelayTween({required double begin,required double end,required this.delay})
      : super(begin: begin, end: end);

  @override
  double lerp(double t) {
    if (t < delay) {
      return begin!;
    } else {
      return super.lerp((t - delay) / (1 - delay));
    }
  }
}