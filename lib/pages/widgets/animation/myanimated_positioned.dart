import 'package:flutter/material.dart';

class MyAnimatedPositioned extends StatefulWidget {
  @override
  _MyAnimatedPositionedState createState() => _MyAnimatedPositionedState();
}

class _MyAnimatedPositionedState extends State<MyAnimatedPositioned> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('AnimatedPositioned'),
        Container(
          color: Colors.grey[300],
          width: 200,
          height: 350,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selected = !_selected;
              });
            },
            child: Stack(
              children: [
                AnimatedPositioned(
                  width: _selected ? 200 : 50,
                  height: _selected ? 50 : 200,
                  top: _selected ? 50 : 150,
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    color: Colors.blue,
                    child: Center(child: Text('tap me')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
