import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:flutter/material.dart';

class BottomsheetNav extends StatelessWidget {
  const BottomsheetNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: SizeResponsive.get(context, 20),
            backgroundColor: const Color(0x33FF8412),
            child: const Icon(Icons.arrow_back, size: 18, color: Colors.white,),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: SizeResponsive.get(context, 20),
            backgroundColor: const Color(0xFFFF8412),
            child: const Icon(Icons.arrow_forward, size: 18, color: Colors.white,),
          )
        ],
      ),
    );
  }
}