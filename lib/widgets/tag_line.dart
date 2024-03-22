import 'package:flutter/material.dart';

class TagLine extends StatefulWidget {
  const TagLine({super.key});

  @override
  State<TagLine> createState() => _TagLineState();
}

class _TagLineState extends State<TagLine> {
  final data = ["we provide only the best service", "Expert service starting at just rs. 500"];
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();

    Future.delayed(const Duration(seconds: 3), (){
      pageController.animateToPage(1, duration: const Duration(milliseconds: 800), curve: Curves.bounceOut);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: const Color(0xFF2B275A),
      ),
      constraints: const BoxConstraints(
        maxWidth: 284
      ),
      alignment: Alignment.center,
      child: PageView.builder(
        itemCount: 2,
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,

        itemBuilder: (context, idx) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: ImageIcon(AssetImage("res/icons/blink.png"), size: 11, color: Colors.white,)),
              Text(data[idx].toUpperCase(), style: const TextStyle(
                fontFamily: "Kumbhsans",
                color: Color(0xFFFFC895),
                fontSize: 9,
                height: 1,
                fontWeight: FontWeight.w700
              )),
              const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: ImageIcon(AssetImage("res/icons/blink.png"), size: 11, color: Colors.white,))
            ],
          );
        }
      ),
    );
  }
}