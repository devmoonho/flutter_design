import 'dart:ui';

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
        Column(
          children: [
            Text('Painter'),
            Container(
              height: 300,
              color: Colors.grey[200],
              child: CustomPaint(
                painter: MyCustomPainter(),
                child: Container(),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text('canvas.point'),
            Container(
              height: 300,
              color: Colors.grey[200],
              child: CustomPaint(
                painter: MyCustomPainterPoint(),
                child: Container(),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text('canvas.drawLine'),
            Container(
              height: 300,
              color: Colors.grey[200],
              child: CustomPaint(
                painter: MyCustomPainterLine(),
                child: Container(),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text('canvas.drawRect'),
            Container(
              height: 300,
              color: Colors.grey[200],
              child: CustomPaint(
                painter: MyCustomPainterRect(),
                child: Container(),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text('canvas.drawRRect'),
            Container(
              height: 300,
              color: Colors.grey[200],
              child: CustomPaint(
                painter: MyCustomPainterRRect(),
                child: Container(),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text('canvas.drawArc'),
            Container(
              height: 300,
              color: Colors.grey[200],
              child: CustomPaint(
                painter: MyCustomPainterArc(),
                child: Container(),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text('canvas.drawCircle'),
            Container(
              height: 300,
              color: Colors.grey[200],
              child: CustomPaint(
                painter: MyCustomPainterCircle(),
                child: Container(),
              ),
            ),
          ],
        ),
      ].map((e) => Padding(padding: EdgeInsets.all(10), child: e)).toList(),
    );
  }
}

class MyCustomPainterPoint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double padding = 30;

    canvas.drawPoints(
      PointMode.points,
      List.generate(8, (i) => Offset(padding * (i + 1), padding)),
      Paint()..strokeWidth = 10.0,
    );

    canvas.drawPoints(
      PointMode.points,
      List.generate(8, (i) => Offset(padding * (i + 1), padding * 2)),
      Paint()
        ..strokeWidth = 10.0
        ..strokeCap = StrokeCap.round,
    );

    canvas.drawPoints(
      PointMode.lines,
      List.generate(8, (i) => Offset(padding * (i + 1), padding * 3)),
      Paint()
        ..strokeWidth = 10.0
        ..strokeCap = StrokeCap.round,
    );

    canvas.drawPoints(
      PointMode.polygon,
      List.generate(8, (i) => Offset(padding * (i + 1), padding * 4)),
      Paint()
        ..strokeWidth = 10.0
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyCustomPainterCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(size.width * (1 / 4), size.height * (1 / 4)),
        60.0,
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 3.0
          ..style = PaintingStyle.stroke);
    canvas.drawCircle(
        Offset(size.width * (3 / 4), size.height * (1 / 4)),
        60.0,
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 3.0
          ..style = PaintingStyle.fill);

    canvas.drawOval(
        Rect.fromLTRB(30.0, 200.0, 150.0, 250.0),
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 3.0
          ..style = PaintingStyle.stroke);
    canvas.drawOval(
        Rect.fromLTRB(200.0, 200.0, 330.0, 250.0),
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 3.0
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyCustomPainterArc extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double padding = 40;
    final double radius = 60;

    canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width * (1 / 4), padding), radius: radius),
        0,
        math.pi / 2,
        false,
        Paint()
          ..color = Colors.blue
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);

    canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width * (3 / 4), padding), radius: radius),
        0.0,
        math.pi * 2 / 3,
        true,
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);

    canvas.drawArc(
        Rect.fromLTWH(padding, radius * 3, radius * 2, radius * (3 / 4)),
        0.0,
        math.pi * 2 * (3 / 4),
        true,
        Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.fill);

    canvas.drawArc(
        Rect.fromPoints(
          Offset(size.width / 2 + padding, size.height / 2),
          Offset(size.width / 2 + padding + radius, size.height / 2 + padding + radius),
        ),
        0.0,
        math.pi * 2 * (3 / 4),
        true,
        Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyCustomPainterRRect extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double padding = 40;
    final double width = 150;
    final double height = 100;

    canvas.drawRRect(
        RRect.fromLTRBXY(padding, padding, width, height, 8.0, 8.0),
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);

    canvas.drawRRect(
        RRect.fromLTRBR(padding + width, padding, width * 2, height, Radius.circular(8.0)),
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);

    canvas.drawRRect(
        RRect.fromLTRBAndCorners(padding, padding + height, size.width - width - padding, size.height - height,
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(20.0)),
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);

    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(padding + width, padding + height, width - padding, height - padding),
          Radius.elliptical(8.0, 18.0),
        ),
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);

    canvas.drawRRect(
        RRect.fromRectXY(
            Rect.fromCircle(center: Offset(size.width / 4, size.height - padding), radius: 30.0), 8.0, 8.0),
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyCustomPainterRect extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double padding = 40;
    final double width = 150;
    final double height = 100;

    canvas.drawRect(
        Rect.fromPoints(Offset(padding, padding), Offset(width, height)),
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);

    canvas.drawRect(
        Rect.fromPoints(Offset(width + padding, padding), Offset(width * 2, height)),
        Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.fill);

    canvas.drawRect(Rect.fromLTRB(padding, height + padding, width, height * 2), Paint()..color = Colors.blue);
    canvas.drawRect(Rect.fromLTWH(padding + width, height + padding, width - padding, height - padding),
        Paint()..color = Colors.blue);
    canvas.drawRect(
        Rect.fromCircle(center: Offset(size.width / 4, size.height - padding), radius: 30.0),
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyCustomPainterLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final paintLine = Paint();
    paintLine.color = Colors.blue;
    paintLine.strokeWidth = 5;
    canvas.drawLine(Offset.zero, center, paintLine);
    canvas.drawLine(Offset(30.0, 90.0), Offset(size.width - 30.0, 90.0), Paint()..strokeWidth = 4.0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
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
