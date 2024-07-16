import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/responsive/text_responsive.dart';
import 'package:flutter/material.dart';

class AppointmentType extends StatelessWidget {
  const AppointmentType({super.key});

  @override
  Widget build(BuildContext context) {
    var items = [
      {'label': 'Visit Clinic', 'id': 1},
      {'label': 'Video Call', 'id': 2},
      {'label': 'Voice Call', 'id': 3},
    ];

    ValueNotifier notifier = ValueNotifier(1);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (_, val, __) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: items
                    .map((e) => GestureDetector(
                          onTap: () => notifier.value = e['id'],
                          child: Container(
                            decoration: BoxDecoration(
                                color: val == e['id']
                                    ? const Color(0xFFFF8412)
                                    : Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                border: Border.all(
                                    color: val == e['id']
                                        ? Colors.white
                                        : const Color(0xFFFF8412),
                                    width: 3)),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                vertical: SizeResponsive.get(context, 8),
                                horizontal: 10),
                            child: Text('${e['label']}',
                                style: TextStyle(
                                    color: val == e['id']
                                        ? Colors.white
                                        : const Color(0xFFFF8412),
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        TextResponsive.getResponsiveFontSize(
                                            context, 10),
                                    fontFamily: "Kumbhsans")),
                          ),
                        ))
                    .toList());
          }),
    );
  }
}
