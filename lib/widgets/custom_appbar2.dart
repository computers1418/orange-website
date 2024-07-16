import 'package:dentist_india_plus/extensions%20copy/number_exten.dart';
import 'package:flutter/material.dart';

import '../responsive/size_responsive.dart';
import '../responsive/text_responsive.dart';

class CustomAppBar2 extends StatelessWidget {
  final IconData? closeIcon;
  final VoidCallback onClose;
  final VoidCallback onMenuClick;
  final Widget? widget;
  const CustomAppBar2({
    super.key,
    this.closeIcon,
    required this.onClose,
    required this.onMenuClick,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(SizeResponsive.get(context, 16), 8,
          SizeResponsive.get(context, 16), 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                children: [
                  4.h(),
                  GestureDetector(
                    onTap: () => onClose(),
                    child: Container(
                      height: SizeResponsive.get(context, 30),
                      width: SizeResponsive.get(context, 30),
                      decoration: BoxDecoration(
                        color: const Color(0x1AFFFFFF),
                        border: Border.all(color: const Color(0x0DFFFFFF)),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: const [
                          BoxShadow(blurRadius: 4, color: Color(0x1AFFFFFF))
                        ],
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        closeIcon ?? Icons.arrow_back,
                        size: SizeResponsive.get(context, 18),
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                'res/images/logo_full.png',
                width: 120,
              ),
            ],
          ),
          Row(
            children: [
              widget ?? const SizedBox.shrink(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: TextStyle(
                      fontFamily: "Kumbhsans",
                      color: const Color(0xFFFFFFFF),
                      fontSize:
                          TextResponsive.getResponsiveFontSize(context, 6),
                      height: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        "DL",
                        style: TextStyle(
                          fontFamily: "KumbhsansSemiBold",
                          color: const Color(0xFFFFFFFF),
                          fontSize:
                              TextResponsive.getResponsiveFontSize(context, 12),
                          height: 1,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Image.asset(
                'res/images/avatar.png',
                width: 40,
              ),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: () => onMenuClick(),
                child: Container(
                  height: SizeResponsive.get(context, 35),
                  width: SizeResponsive.get(context, 35),
                  decoration: BoxDecoration(
                    color: const Color(0x1AFFFFFF),
                    border: Border.all(color: const Color(0x0DFFFFFF)),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const [
                      BoxShadow(blurRadius: 4, color: Color(0x1AFFFFFF))
                    ],
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const ImageIcon(
                    AssetImage("res/icons/menu.png"),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
