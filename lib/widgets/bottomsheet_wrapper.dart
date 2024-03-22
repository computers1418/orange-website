import 'package:flutter/material.dart';

import 'notch.dart';

class BottomsheetWrapper extends StatelessWidget {
  final Widget child;
  const BottomsheetWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Container(
          margin: const EdgeInsets.only(top: 28),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(0))),
          child: Column(
            children: [
              child,
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Notch(),
              ),
            ],
          ))
    ]);
  }
}
