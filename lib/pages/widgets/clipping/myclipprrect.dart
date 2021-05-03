import 'package:flutter/material.dart';

class MyClipRRect extends StatefulWidget {
  @override
  _MyClipRRectState createState() => _MyClipRRectState();
}

class _MyClipRRectState extends State<MyClipRRect> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('ClipRRect'),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Align(
            alignment: Alignment.topLeft,
            widthFactor: 0.5,
            heightFactor: 0.5,
            child: Container(
              color: Colors.blue,
              width: 300,
              height: 300,
              child: FlutterLogo(),
            ),
          ),
        ),
      ],
    );
  }
}
