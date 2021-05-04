import 'package:flutter/material.dart';

class MyClipPath extends StatefulWidget {
  @override
  _MyClipPathState createState() => _MyClipPathState();
}

class _MyClipPathState extends State<MyClipPath> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: Center(
          child: Text(
            'ClipPath',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 50);

    BaseLine bl = BaseLine(sx: 0.0, sy: size.height - 50, ex: size.width, ey: size.height);
    path.quadraticBezierTo(size.width / 4, bl.getY(size.width / 4) + 30, size.width / 2, bl.getY(size.width / 2));
    path.quadraticBezierTo(size.width * 3 / 4, bl.getY(size.width * 3 / 4) - 30, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BaseLine {
  final double sx;
  final double sy;
  final double ex;
  final double ey;
  double? m;
  double? b;

  BaseLine({required this.sx, required this.sy, required this.ex, required this.ey}) {
    m = (ey - sy) / (ex - sx);
    b = sy - (sx * m!);
  }

  double getX(double y) {
    return (y - b!) / m!;
  }

  double getY(double x) {
    return m! * x + b!;
  }
}
