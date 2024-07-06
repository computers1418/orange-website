import 'package:flutter/material.dart';

import '../responsive/size_responsive.dart';
import '../responsive/text_responsive.dart';

class CityItem extends StatelessWidget {
  final Map item;
  final VoidCallback onSelect;
  const CityItem({super.key, required this.item, required this.onSelect});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(item['image'], width: double.infinity, fit: BoxFit.fill),
          ),
          const SizedBox(height: 8,),
          Row(
            children: [
              Expanded(
                child: Text(item['city'], style: TextStyle(
                  fontFamily: "Kumbhsans",
                  color: const Color(0xFF2B275A),
                  fontSize: TextResponsive.getResponsiveFontSize(context, 13),
                  fontWeight: FontWeight.w700
                )),
              ),
              GestureDetector(
                onTap: onSelect,
                child: Container(
                  height: SizeResponsive.get(context, 30),
                  width: 76,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFFFF8412)
                  ),
                  child: Text("SELECT", style: TextStyle(
                      fontFamily: "KumbhsansSemiBold",
                      color: Colors.white,
                      fontSize: TextResponsive.getResponsiveFontSize(context, 10),
                      fontWeight: FontWeight.w800
                    )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}