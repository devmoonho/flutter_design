import 'package:flutter/material.dart';

class MyClipRect extends StatefulWidget {
  @override
  _MyClipRectState createState() => _MyClipRectState();
}

class _MyClipRectState extends State<MyClipRect> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('ClipRect'),
        ClipRect(
          child: Align(
            alignment: Alignment.topRight,
            heightFactor: 0.5,
            widthFactor: 0.5,
            child: Container(
              height: 300,
              width: 300,
              color: Colors.blue,
              child: FlutterLogo(size: 150),
            ),
          ),
        ),
      ],
    );
  }
}
