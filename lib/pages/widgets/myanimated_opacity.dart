import 'package:flutter/material.dart';

class MyAnimatedOpacity extends StatefulWidget {
  @override
  _MyAnimatedOpacityState createState() => _MyAnimatedOpacityState();
}

class _MyAnimatedOpacityState extends State<MyAnimatedOpacity> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 0 ? 1.0 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _changeOpacity();
      },
      child: Column(
        children: [
          Text('AnimatedOpacity'),
          Container(
            height: 200,
            width: 200,
            color: Colors.grey[300],
            child: AnimatedOpacity(
              opacity: opacityLevel,
              duration: Duration(seconds: 1),
              child: FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }
}
