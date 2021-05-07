import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

enum AXIS { X, Y }

class MyBlob extends StatefulWidget {
  @override
  _MyBlobState createState() => _MyBlobState();
}

class _MyBlobState extends State<MyBlob> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text('Blob'),
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                height: 300,
                color: Colors.grey[200],
                child: CustomPaint(
                  painter: Blob(),
                  child: Container(),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text('Blob Random Point'),
            Container(
              height: 300,
              color: Colors.grey[200],
              child: CustomPaint(
                painter: BlobRandomPoint(),
                child: Container(),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text('Blob Point'),
            Container(
              height: 300,
              color: Colors.grey[200],
              child: CustomPaint(
                painter: BlobPoint(),
                child: Container(),
              ),
            ),
          ],
        ),
      ].map((e) => Padding(padding: EdgeInsets.all(10), child: e)).toList(),
    );
  }
}

class Blob extends CustomPainter {
  List<Offset> getPoint(Offset center, int count, double radius, double padding) {
    double length = radius * 4;
    double each = length / count;
    double top = center.dy - radius;
    double bottom = center.dy + radius;

    MyCirclePoint cp = MyCirclePoint(center: center, radius: radius);

    return List.generate(count, (i) {
      double y = top + each * i;

      if (y > bottom) {
        y = bottom - (y - bottom);
        return Offset(cp.getX(y, isOverDegree: true), y.toDouble());
      } else {
        return Offset(cp.getX(y, isOverDegree: false), y.toDouble());
      }
      // return Offset(center.dx, y.toDouble());
    });
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final double padding = 10;
    double outRadius = math.min(size.width, size.height) / 2 - padding;
    double inRadius = math.min(size.width, size.height) / 4.5 - padding;

    // outCircle
    canvas.drawCircle(
      center,
      outRadius,
      Paint()..style = PaintingStyle.stroke,
    );

    // inCircle
    canvas.drawCircle(
      center,
      inRadius,
      Paint()..style = PaintingStyle.stroke,
    );

    canvas.drawPoints(
        PointMode.points,
        getPoint(center, 3 0, inRadius, padding),
        Paint()
          ..strokeWidth = 5.0
          ..strokeCap = StrokeCap.round);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BlobRandomPoint extends CustomPainter {
  double getRandom(Offset c, AXIS a, double r, double p) {
    double axis = a == AXIS.X ? c.dx : c.dy;
    int top = p.round() + axis.round() - r.round();
    int ran = top + math.Random().nextInt(axis.round() + r.round() - top);
    return ran.toDouble();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final double padding = 10;
    double outRadius = math.min(size.width, size.height) / 2 - padding;
    double inRadius = math.min(size.width, size.height) / 4.5 - padding;

    MyCirclePoint outPoint = MyCirclePoint(center: center, radius: outRadius);
    MyCirclePoint inPoint = MyCirclePoint(center: center, radius: inRadius);
    int divie = 2;

    // outCircle
    canvas.drawCircle(
      center,
      outRadius,
      Paint()..style = PaintingStyle.stroke,
    );

    canvas.drawPoints(
      PointMode.points,
      List.generate(divie, (i) {
        double ranY = getRandom(center, AXIS.Y, outRadius, padding);
        return Offset(outPoint.getX(ranY, isOverDegree: false), ranY);
      }).toList()
        ..addAll(
          List.generate(divie, (i) {
            double ranY = getRandom(center, AXIS.Y, outRadius, padding);
            return Offset(outPoint.getX(ranY, isOverDegree: true), ranY);
          }),
        ),
      Paint()
        ..strokeWidth = 5.0
        ..strokeCap = StrokeCap.round,
    );

    // inCircle
    canvas.drawCircle(
      center,
      inRadius,
      Paint()..style = PaintingStyle.stroke,
    );

    canvas.drawPoints(
      PointMode.points,
      List.generate(divie, (i) {
        double ranY = getRandom(center, AXIS.Y, inRadius, padding);
        return Offset(inPoint.getX(ranY, isOverDegree: false), ranY);
      }).toList()
        ..addAll(
          List.generate(divie, (i) {
            double ranY = getRandom(center, AXIS.Y, inRadius, padding);
            return Offset(inPoint.getX(ranY, isOverDegree: true), ranY);
          }),
        ),
      Paint()
        ..strokeWidth = 5.0
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BlobPoint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final double padding = 10;
    double outRadius = math.min(size.width, size.height) / 2 - padding;
    double inRadius = math.min(size.width, size.height) / 4.5 - padding;

    MyCirclePoint outPoint = MyCirclePoint(center: center, radius: outRadius);
    MyCirclePoint inPoint = MyCirclePoint(center: center, radius: inRadius);

    // outCircle
    canvas.drawCircle(
      center,
      outRadius,
      Paint()..style = PaintingStyle.stroke,
    );

    canvas.drawPoints(
      PointMode.points,
      [
        Offset(size.width / 2 + outRadius, outPoint.getY(size.width / 2 + outRadius)),
        Offset(size.width / 2 - outRadius, outPoint.getY(size.width / 2 - outRadius)),
        Offset(outPoint.getX(size.height / 2 - outRadius), size.height / 2 - outRadius),
        Offset(outPoint.getX(size.height / 2 + outRadius), size.height / 2 + outRadius),
      ],
      Paint()
        ..strokeWidth = 5.0
        ..strokeCap = StrokeCap.round,
    );

    // inCircle
    canvas.drawCircle(
      center,
      inRadius,
      Paint()..style = PaintingStyle.stroke,
    );

    canvas.drawPoints(
      PointMode.points,
      [
        Offset(size.width / 2 + inRadius, inPoint.getY(size.width / 2 + inRadius)),
        Offset(size.width / 2 - inRadius, inPoint.getY(size.width / 2 - inRadius)),
        Offset(inPoint.getX(size.height / 2 - inRadius), size.height / 2 - inRadius),
        Offset(inPoint.getX(size.height / 2 + inRadius), size.height / 2 + inRadius),
      ],
      Paint()
        ..strokeWidth = 5.0
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyCirclePoint {
  final Offset center;
  final double radius;

  MyCirclePoint({required this.center, required this.radius});

  double getX(double dy, {bool isOverDegree = true}) {
    final x =
        (isOverDegree ? -1 : 1) * math.sqrt((radius * radius - (dy - center.dy) * (dy - center.dy)).abs()) + center.dx;
    return x.toDouble();
  }

  double getY(double dx, {bool isOverDegree = true}) {
    final y =
        (isOverDegree ? -1 : 1) * math.sqrt((radius * radius - (dx - center.dx) * (dx - center.dx)).abs()) + center.dy;
    return y.toDouble();
  }
}
