import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:flutter/material.dart';

class BottomsheetClose extends StatelessWidget {
  const BottomsheetClose({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: ImageIcon(const AssetImage('res/icons/close.png'), size: SizeResponsive.get(context, 40), color: Colors.white)),
          const SizedBox(height: 4,),
          const Text('CLOSE', style:  TextStyle(
            fontFamily: "Kumbhsans",
            color:Colors.white,
            fontSize: 8,
            height: 1,
            fontWeight: FontWeight.w600
          ))
        ],
      ));
  }
}