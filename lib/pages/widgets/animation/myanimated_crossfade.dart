import 'package:flutter/material.dart';

class MyAnimatedCrossFade extends StatefulWidget {
  MyAnimatedCrossFade();
  @override
  State<StatefulWidget> createState() => _MyAnimatedCrossFade();
}

class _MyAnimatedCrossFade extends State<MyAnimatedCrossFade> {
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
          Text('AnimatedCrossFade'),
          Container(
            child: AnimatedCrossFade(
              crossFadeState: _selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: Duration(seconds: 3),
              firstCurve: Curves.bounceIn,
              secondCurve: Curves.fastOutSlowIn,
              firstChild: _firstWidget(),
              secondChild: _secondWidget(),
            ),
          ),
        ],
      ),
    );
  }

  _firstWidget() {
    return Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: Align(
        alignment: Alignment.topLeft,
        child: Text('FIRST'),
      ),
    );
  }

  _secondWidget() {
    return Container(
      height: 200,
      width: 200,
      color: Colors.red,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text('SECOND'),
      ),
    );
  }
}
