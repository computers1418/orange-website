import 'package:dentist_india_plus/extensions%20copy/context_exten.dart';
import 'package:dentist_india_plus/extensions/num_exten.dart';
import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:flutter/material.dart';

import '../responsive/text_responsive.dart';

class DrawerListItem extends StatelessWidget {
  final String icon;
  final String name;
  final String? path;
  final String selected;
  final ValueChanged onClick;
  const DrawerListItem({super.key, required this.icon, required this.name, required this.selected, required this.onClick, this.path});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  (){
        onClick(selected==name ? '' : name );
        if(path!=null){
          context.goto(path!);
        }
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 0, 12, SizeResponsive.getHeightverse(context, 8)),
        decoration: BoxDecoration(
          color: selected == name? const Color(0xFF2B275A) : const Color(0xFFF4F4F7),
          borderRadius: BorderRadius.circular(30)
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            ImageIcon(AssetImage(icon), size: TextResponsive.getResponsiveFontSize(context, 18), color: selected == name ? const Color(0xFFFF8412): const Color(0xFF5D5A81),),
            8.hgap(),
            Text(name, style: TextStyle(
              fontFamily: "Kumbhsans",
              color: selected == name ? Colors.white: const Color(0xBF2B275A),
              fontSize: TextResponsive.getResponsiveFontSize(context, 14),
              fontWeight: FontWeight.w800
            ))
          ],  
        ),
      ),
    );
  }
}