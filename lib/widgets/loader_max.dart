import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoaderMax extends StatefulWidget {
  const LoaderMax({super.key});

  @override
  State<LoaderMax> createState() => _LoaderMaxState();
}

class _LoaderMaxState extends State<LoaderMax> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _animation1 = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: Curves.bounceIn,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller2.forward();
        }
      });

    _animation2 = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.bounceIn,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller3.forward();
        }
      });

    _animation3 = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller3,
        curve: Curves.bounceIn,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller3.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller1.forward();
        }
      });

    _controller1.forward();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTransition(
          scale: _animation1,
          child: Image.asset(
            "res/images/loader_logo.png",
            width: 18,
            height: 18,
          ),
        ),
        const SizedBox(width: 8), // Add spacing between images
        ScaleTransition(
          scale: _animation2,
          child: Image.asset(
            "res/images/loader_logo.png",
            width: 18,
            height: 18,
          ),
        ),
        const SizedBox(width: 8), // Add spacing between images
        ScaleTransition(
          scale: _animation3,
          child: Image.asset(
            "res/images/loader_logo.png",
            width: 18,
            height: 18,
          ),
        ),
      ],
    );
  }
}
