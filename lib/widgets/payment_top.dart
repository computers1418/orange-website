import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:flutter/material.dart';

import '../drawer/drawer_dialog.dart';
import 'custom_appbar2.dart';
import 'payment_types.dart';

class PaymentTop extends StatelessWidget {
  const PaymentTop({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomAppBar2(
          onClose: () {
            Navigator.of(context).pop();
          },
          
          onMenuClick: () {
            showDialog(
              context: context,
              // isScrollControlled: true,
              // backgroundColor: Colors.transparent,
              builder: (_) {
                return const DrawerDialog();
              },
            );
          },
        ),
        Visibility(
            visible: height >= 800,
            child: const SizedBox(
              height: 20,
            )),
        const PaymentTypes(),
        Visibility(
            visible: height >= 800,
            child: const SizedBox(
              height: 20,
            )),
        Container(
          height: SizeResponsive.get(context, height > 700 ? 160 : 90),
          margin: const EdgeInsets.fromLTRB(30, 16, 30, 0),
          decoration: BoxDecoration(
              color: const Color(0x33FFFFFF),
              borderRadius: const BorderRadius.all(Radius.circular(35)),
              border: Border.all(color: const Color(0x1AFFFFFF))),
        ),
      ],
    );
  }
}
