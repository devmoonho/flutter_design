import 'package:flutter/material.dart';

import '../animation_page.dart';

class MyAnimatedAlign extends StatefulWidget {
  final Callback refresh;
  late final bool selected;
  MyAnimatedAlign({required this.refresh, required this.selected});

  @override
  _MyAnimatedAlignState createState() => _MyAnimatedAlignState();
}

class _MyAnimatedAlignState extends State<MyAnimatedAlign> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.refresh({MyAnimatedAlign: !widget.selected});
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text('AnimatedAlign'),
            Center(
              child: Container(
                height: 200.0,
                width: 200.0,
                color: Colors.blue,
                child: AnimatedAlign(
                  alignment: widget.selected ? Alignment.topRight : Alignment.bottomLeft,
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
