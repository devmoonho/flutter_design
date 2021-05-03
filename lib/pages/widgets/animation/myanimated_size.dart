import 'package:flutter/material.dart';

class MyAnimatedSize extends StatefulWidget {
  @override
  _MyAnimatedSizeState createState() => _MyAnimatedSizeState();
}

class _MyAnimatedSizeState extends State<MyAnimatedSize> with TickerProviderStateMixin {
  double _size = 250.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _size = _size == 250.0 ? 100 : 250;
        });
      },
      child: Column(
        children: [
          Text('AnimatedSize'),
          Container(
            color: Colors.amber,
            child: AnimatedSize(
              vsync: this,
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              child: FlutterLogo(size: _size),
            ),
          ),
        ],
      ),
    );
  }
}
