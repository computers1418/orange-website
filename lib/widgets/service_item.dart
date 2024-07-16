import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final String icon;
  final String service;
  final String? amount;
  final bool selected;
  final VoidCallback onClick;
  const ServiceItem(
      {super.key,
      required this.onClick,
      required this.icon,
      required this.service,
      this.amount,
      this.selected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color:
                selected ? const Color(0xFFFF8412) : const Color(0xFFF2F7FB)),
        child: Row(
          children: [
            CircleAvatar(
              radius: SizeResponsive.get(context, 20),
              backgroundColor: Color(selected ? 0x33FFFFFF : 0xFFE5F1FA),
              child: ImageIcon(
                AssetImage(icon),
                size: SizeResponsive.get(context, 20),
                color: selected
                    ? const Color(0xFFFFFFFF)
                    : const Color(0xFF2B275A),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(service,
                  style: TextStyle(
                      fontFamily: "Kumbhsans",
                      color: Color(!selected ? 0xFF2B275A : 0xFFFFFFFF),
                      fontSize:
                          TextResponsive.getResponsiveFontSize(context, 13),
                      height: 1,
                      fontWeight: FontWeight.w700)),
            ),
            Visibility(
              visible: amount != null,
              child: Text(amount ?? '',
                  style: TextStyle(
                      fontFamily: "KumbhsansSemiBold",
                      color: Color(!selected ? 0xFFFF8412 : 0xFFFFFFFF),
                      fontSize:
                          TextResponsive.getResponsiveFontSize(context, 14),
                      height: 1,
                      fontWeight: FontWeight.w800)),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
