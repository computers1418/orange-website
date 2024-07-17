import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final String? text;
  final bool secondary;
  const StyledButton({super.key, this.text, this.secondary = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: 200,
              // maxHeight: 60,
            ),
            width: 180,
            height: MediaQuery.of(context).size.height > 700
                ? SizeResponsive.get(context, 60)
                : SizeResponsive.get(context, 45),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: secondary
                      ? const Color(0xFFFF8412)
                      : const Color(0xFF2B275A),
                  blurRadius: 30,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, right: 10),
            constraints: const BoxConstraints(
              maxWidth: 200,
              // maxHeight: 60,
            ),
            height: MediaQuery.of(context).size.height > 700
                ? SizeResponsive.get(context, 60)
                : SizeResponsive.get(context, 45),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color:
                  secondary ? const Color(0xFFFF8412) : const Color(0xFF2B275A),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              // alignment: Alignment.center,
              children: [
                Text(
                  text ?? "Quick Booking",
                  style: TextStyle(
                    fontFamily: "Kumbhsans",
                    color: const Color(0xFFFFFFFF),
                    fontSize: TextResponsive.getResponsiveFontSize(context, 18),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 5),
                Image.asset(
                  secondary ? "res/icons/star.png" : "res/icons/star2.png",
                  height: 11,
                  width: 11,
                  color: secondary ? Colors.white : const Color(0xFFFF8412),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
