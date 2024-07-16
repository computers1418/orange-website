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
  final ValueNotifier notifier;
  const DrawerListItem({
    super.key,
    required this.icon,
    required this.name,
    required this.selected,
    required this.onClick,
    this.path,
    required this.notifier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onClick(selected == name ? '' : name);
            if (path != null) {
              Future.delayed(const Duration(milliseconds: 800), () {
                context.goto(path!).then((_) => notifier.value = '');
              });
            }
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(
              12,
              0,
              12,
              name == "Previous Appointments" && selected == name
                  ? 0
                  : SizeResponsive.getHeightverse(context, 8),
            ),
            decoration: BoxDecoration(
              color: selected == name
                  ? const Color(0xFF2B275A)
                  : const Color(0xFFF4F4F7),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage(icon),
                  size: TextResponsive.getResponsiveFontSize(context, 18),
                  color:
                      selected == name ? Colors.white : const Color(0xFF5D5A81),
                ),
                8.hgap(),
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: "Kumbhsans",
                    color: selected == name
                        ? Colors.white
                        : const Color(0xBF2B275A),
                    fontSize: TextResponsive.getResponsiveFontSize(context, 14),
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
          ),
        ),
        if (name == "Previous Appointments" && selected == name)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFF8412),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(100),
                    topLeft: Radius.circular(50),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                margin: EdgeInsets.fromLTRB(
                  0,
                  0,
                  40,
                  SizeResponsive.getHeightverse(context, 8),
                ),
                child: Text(
                  "Download App to Access This Feature",
                  style: TextStyle(
                    fontFamily: "Kumbhsans",
                    color: Colors.white,
                    fontSize: TextResponsive.getResponsiveFontSize(context, 12),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
