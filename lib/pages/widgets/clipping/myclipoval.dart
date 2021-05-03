import 'package:flutter/material.dart';

class MyClipOval extends StatefulWidget {
  @override
  _MyClipOvalState createState() => _MyClipOvalState();
}

class _MyClipOvalState extends State<MyClipOval> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('ClipOval'),
        ClipOval(
          child: Container(
            color: Colors.blue,
            width: 200,
            height: 150,
            child: FlutterLogo(),
          ),
        ),
      ],
    );
  }
}
