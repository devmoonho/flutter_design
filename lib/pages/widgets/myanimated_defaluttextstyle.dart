import 'package:flutter/material.dart';

import '../animation_page.dart';

class MyAnimatedDefalutTextStyle extends StatefulWidget {
  final Callback refresh;
  late final bool selected;

  MyAnimatedDefalutTextStyle({required this.refresh, required this.selected});

  @override
  _MyAnimatedDefalutTextStyleState createState() => _MyAnimatedDefalutTextStyleState();
}

class _MyAnimatedDefalutTextStyleState extends State<MyAnimatedDefalutTextStyle> {
  Map<String, dynamic> mapTextStyle = {
    'fontSize': 50.0,
    'fontColor': Colors.white,
    'fontWeight': FontWeight.w100,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {
          setState(() => _setTextStyle(widget.selected));
          widget.refresh({MyAnimatedDefalutTextStyle: !widget.selected});
        },
        child: Column(
          children: [
            Text('AnimatedDefalutTextStyle'),
            Container(
              height: 100,
              width: 300,
              color: Colors.blue,
              child: AnimatedDefaultTextStyle(
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                style: TextStyle(
                  fontSize: mapTextStyle['fontSize'] * 1.0,
                  color: mapTextStyle['fontColor'],
                  fontWeight: mapTextStyle['fontWeight'],
                ),
                child: Center(child: Text('Flutter')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setTextStyle(bool selected) {
    if (selected) {
      mapTextStyle = {
        'fontSize': 50.0,
        'fontColor': Colors.white,
        'fontWeight': FontWeight.w100,
      };
    } else {
      mapTextStyle = {
        'fontSize': 50.0,
        'fontColor': Colors.red,
        'fontWeight': FontWeight.w500,
      };
    }
  }
}
