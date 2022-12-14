import 'dart:math' as math;

import 'package:flutter/material.dart';

class GradientCircularProgress extends StatefulWidget {
  const GradientCircularProgress({Key? key}) : super(key: key);

  @override
  State<GradientCircularProgress> createState() =>
      _GradientCircularProgressState();
}

class _GradientCircularProgressState extends State<GradientCircularProgress>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _initializeCurvesAnimation();
  }

  void _initializeCurvesAnimation() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.addListener(() => setState(() {}));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // while (true) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: SizedBox(
        height: 50,
        width: 50,
        child: CustomPaint(
          painter: GradientCircularProgressPainter(
            // currentProgress: _animation.value,
            gradient: SweepGradient(
              colors: [Colors.transparent, Colors.blue[300]!],
            ),
          ),
        ),
      ),
    );
  }
  // );
  // }
}

class GradientCircularProgressPainter extends CustomPainter {
  Gradient gradient;
  // double currentProgress;

  GradientCircularProgressPainter({
    required this.gradient,
    // required this.currentProgress,
  });
  @override
  void paint(Canvas canvas, Size size) {
    size = const Size.fromRadius(25);
    double offset = 4 / 2;
    Rect rect = Offset(offset, offset) & Size(size.width - 4, size.height - 4);
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    paint.shader = gradient.createShader(rect);
    canvas.drawArc(rect, 0.0, 2 * math.pi, false, paint);
  }

  @override
  bool shouldRepaint(GradientCircularProgressPainter oldDelegate) => false;
}
