import 'dart:ui';

import 'package:flutter/material.dart';

import 'home_drawer.dart';

class DrawerDialog extends StatelessWidget {
  const DrawerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: const Stack(
          alignment: Alignment.centerLeft,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                HomeDrawer(),
              ],
            )
          ]
        )
      ),
    );
  }
}