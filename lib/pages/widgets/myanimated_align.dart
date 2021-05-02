import 'package:flutter/material.dart';

class MyAnimatedAlign extends StatefulWidget {
  MyAnimatedAlign();

  @override
  _MyAnimatedAlignState createState() => _MyAnimatedAlignState();
}

class _MyAnimatedAlignState extends State<MyAnimatedAlign> {
  bool _selected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {
          _selected = !_selected;
        },
        child: Column(
          children: [
            Text('AnimatedAlign'),
            Center(
              child: Container(
                height: 200.0,
                width: 200.0,
                color: Colors.blue,
                child: AnimatedAlign(
                  alignment: _selected ? Alignment.topRight : Alignment.bottomLeft,
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  child: const FlutterLogo(size: 50.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
