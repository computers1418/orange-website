import 'dart:math';

import 'package:dentist_india_plus/widgets/billing_info.dart';
import 'package:dentist_india_plus/widgets/payment_top.dart';
import 'package:dentist_india_plus/widgets/product_info.dart';
import 'package:dentist_india_plus/widgets/visa_card.dart';
import 'package:flutter/material.dart';

import 'widgets/doctor_pay.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> header;
  late Animation<double> button;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    header = Tween<double>(begin: -500, end: 0).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Curves.ease,
      curve: const Interval(
        0,
        1,
        curve: Curves.easeOut,
      ),
    ));

    button = Tween<double>(begin: 500, end: 0).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Curves.ease,
      curve: const Interval(
        0,
        1,
        curve: Curves.easeOut,
      ),
    ));

    _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AnimatedBuilder(
                animation: header,
                builder: (_, __) {
                  return Transform.rotate(
                    angle: -(header.value / 4) * (pi / 180),
                    child: Transform.translate(
                      offset: Offset(0, header.value),
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 80),
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF8412),
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(30),
                              ),
                            ),
                            child: const PaymentTop(),
                          ),
                          const Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: VisaCard(),
                          )
                        ],
                      ),
                    ),
                  );
                }),
            Visibility(
                visible: height >= 800,
                child: const SizedBox(
                  height: 20,
                )),
            Expanded(
              child: AnimatedBuilder(
                  animation: button,
                  builder: (_, __) {
                    return Transform.translate(
                      offset: Offset(0, button.value),
                      child: Container(
                        padding: EdgeInsets.only(top: height >= 800 ? 30 : 10),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("res/images/wave.png"),
                                fit: BoxFit.fill)),
                        child: const Column(
                          children: [
                            ProductInfo(),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [BillingInfo()],
                            )),
                            DoctorPay()
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
