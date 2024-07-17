import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final ValueNotifier notifier;
  const Indicator({super.key, required this.notifier});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 6,
      child: Stack(
        children: [
          Container(
            width: 6,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0x1AFFFFFF),
                boxShadow: const [
                  BoxShadow(blurRadius: 20, color: Color(0x1AFFFFFF))
                ]),
          ),
          ValueListenableBuilder(
              valueListenable: notifier,
              builder: (_, val, __) {
                return Positioned(
                  bottom: val,
                  child: Container(
                    width: 6,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
