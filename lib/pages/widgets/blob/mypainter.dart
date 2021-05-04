import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyPainter extends StatefulWidget {
  @override
  _MyPainterState createState() => _MyPainterState();
}

class _MyPainterState extends State<MyPainter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Painter'),
        Container(
          height: 300,
          child: CustomPaint(
            painter: MyCustomPainter(),
            child: Container(),
          ),
        ),
      ],
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // body
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;
    final paint = Paint()..color = Colors.yellow;
    canvas.drawCircle(center, radius, paint);

    // mouth
    final smailPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius / 1.5), 0, math.pi, false, smailPaint);

    // eyes
    canvas.drawCircle(Offset(center.dx - radius / 2.5, center.dy - radius / 2.5), 20, Paint());
    canvas.drawCircle(Offset(center.dx + radius / 2.5, center.dy - radius / 2.5), 20, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
