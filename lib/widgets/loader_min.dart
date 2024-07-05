import 'package:flutter/material.dart';

class LoaderMin extends StatefulWidget {
  const LoaderMin({super.key});

  @override
  State<LoaderMin> createState() => _LoaderMinState();
}

class _LoaderMinState extends State<LoaderMin> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _circleController;
  late Animation<double> _circleAnimation;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.bounceIn,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _circleController.forward();
        } else if (status == AnimationStatus.dismissed) {
          _scaleController.forward();
        }
      });

    _circleController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _circleAnimation = Tween<double>(begin: 0, end: 180).animate(
      CurvedAnimation(
        parent: _circleController,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _circleController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _scaleController.reverse();
        }
      });

    _scaleController.forward();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _circleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTransition(
          scale: _scaleAnimation,
          child: CircleAvatar(
            backgroundColor: const Color(0xFFFF8412),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: CustomPaint(
                painter: SemiCirclePainter(_circleAnimation),
                child: const SizedBox(width: 100, height: 100),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SemiCirclePainter extends CustomPainter {
  final Animation<double> animation;

  SemiCirclePainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const startAngle = 0.0;
    final sweepAngle = animation.value * (3.141592653589793 / 180); // Convert degrees to radians
    const useCenter = true;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
