import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatefulWidget {
  MyAnimatedContainer();
  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
      },
      child: Column(
        children: [
          Text('AnimatedContainer'),
          Center(
            child: AnimatedContainer(
              alignment: Alignment.center,
              width: _selected ? 200.0 : 100.0,
              height: _selected ? 100.0 : 200.0,
              color: _selected ? Colors.blue : Colors.red,
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 50),
            ),
          ),
        ],
      ),
    );
  }
}
