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
  List<Offset> getPoint(Offset center, int count, double radius) {
    MyCirclePoint cp = MyCirclePoint(center: center, radius: radius);
    return List.generate(
        count, (i) => cp.getOffset(cp.getX(center.dy, isOver180: false), center.dy, math.pi * 2 * (i / count)));
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final double padding = 10;
    double outRadius = math.min(size.width, size.height) / 2 - padding;
    double inRadius = math.min(size.width, size.height) / 6 - padding;
    int count = 7;

    List<Offset> outPoints = getPoint(center, count, outRadius);
    List<Offset> inPoints = getPoint(center, count, inRadius);

    MyCirclePoint cp = MyCirclePoint(center: center, radius: inRadius);

    // outCircle
    canvas.drawCircle(
      center,
      outRadius,
      Paint()..style = PaintingStyle.stroke,
    );

    canvas.drawPoints(
        PointMode.points,
        outPoints,
        Paint()
          ..strokeWidth = 5.0
          ..strokeCap = StrokeCap.round);

    // inCircle
    canvas.drawCircle(
      center,
      inRadius,
      Paint()..style = PaintingStyle.stroke,
    );

    canvas.drawPoints(
        PointMode.points,
        inPoints,
        Paint()
          ..strokeWidth = 5.0
          ..strokeCap = StrokeCap.round);

    inPoints.asMap().forEach(
          (i, v) => canvas.drawLine(
            inPoints[i],
            outPoints[i],
            Paint()
              ..color = Colors.grey
              ..strokeCap = StrokeCap.round,
          ),
        );

    List<Offset> ranP = List.generate(count, (i) => cp.getRandomOffset(inPoints[i], outPoints[i]));

    canvas.drawPoints(
      PointMode.points,
      ranP,
      Paint()
        ..color = Colors.blue
        ..strokeWidth = 5.0
        ..strokeCap = StrokeCap.round,
    );

    var path = new Path();
    List<List<double>> curves = _createCurves(ranP);
    Offset mid = (ranP[0] + ranP[1]) / 2;
    path.moveTo(mid.dx, mid.dy);
    curves.forEach((curve) {
      path.quadraticBezierTo(curve[0], curve[1], curve[2], curve[3]);
    });
    path.close();

    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.amber
        ..strokeWidth = 2.0
        ..style = PaintingStyle.stroke,
    );
  }

  List<List<double>> _createCurves(List<Offset> points) {
    List<List<double>> curves = [];
    List<Offset> breakpoints = [];
    Offset mid = (points[0] + points[1]) / 2;
    breakpoints.add(mid);
    for (var i = 0; i < points.length; i++) {
      var p1 = points[(i + 1) % points.length];
      var p2 = points[(i + 2) % points.length];
      mid = (p1 + p2) / 2;
      breakpoints.add(mid);
      curves.add([p1.dx, p1.dy, mid.dx, mid.dy]);
    }
    return curves;
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
        return Offset(outPoint.getX(ranY, isOver180: false), ranY);
      }).toList()
        ..addAll(
          List.generate(divie, (i) {
            double ranY = getRandom(center, AXIS.Y, outRadius, padding);
            return Offset(outPoint.getX(ranY, isOver180: true), ranY);
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
        return Offset(inPoint.getX(ranY, isOver180: false), ranY);
      }).toList()
        ..addAll(
          List.generate(divie, (i) {
            double ranY = getRandom(center, AXIS.Y, inRadius, padding);
            return Offset(inPoint.getX(ranY, isOver180: true), ranY);
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

  /*
   * x' = (x-a) * cosR - (y-b) * sinR + a
   * y' = (x-a) * sinR + (y-b) * cosR + b
   */
  Offset getOffset(double dx, double dy, double pi) {
    final double x = (dx - center.dx) * math.cos(pi) - (dy - center.dy) * math.sin(pi) + center.dx;
    final double y = (dx - center.dx) * math.sin(pi) + (dy - center.dy) * math.cos(pi) + center.dy;
    return Offset(x, y);
  }

  // x` = sqrt(pow(r, 2) - pow(y - b, 2)) + a
  double getX(double dy, {bool isOver180 = true}) {
    final x =
        (isOver180 ? -1 : 1) * math.sqrt((radius * radius - (dy - center.dy) * (dy - center.dy)).abs()) + center.dx;
    return x.toDouble();
  }

  // y` = sqrt(pow(r, 2) - pow(x - a, 2)) + b
  double getY(double dx, {bool isOver180 = true}) {
    final y =
        (isOver180 ? -1 : 1) * math.sqrt((radius * radius - (dx - center.dx) * (dx - center.dx)).abs()) + center.dy;
    return y.toDouble();
  }

  Offset getRandomOffset(Offset a, Offset b) {
    final rn = new math.Random();
    final max = math.max(a.dx, b.dx);
    final min = math.min(a.dx, b.dx);
    final m = (a.dy - b.dy) / (a.dx - b.dx);

    double ranX = min + rn.nextInt((max - min).round());
    double ranY = m * (ranX - a.dx) + a.dy;
    return Offset(ranX, ranY);
  }
}
