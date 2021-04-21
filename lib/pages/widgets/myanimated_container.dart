import 'package:flutter/material.dart';

import '../animation_page.dart';

class MyAnimatedContainer extends StatefulWidget {
  final Callback refresh;
  late final bool selected;

  MyAnimatedContainer({required this.refresh, required this.selected});
  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.refresh({MyAnimatedContainer: !widget.selected});
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Text('AnimatedContainer'),
            Center(
              child: AnimatedContainer(
                alignment: Alignment.center,
                width: widget.selected ? 200.0 : 100.0,
                height: widget.selected ? 100.0 : 200.0,
                color: widget.selected ? Colors.blue : Colors.red,
                duration: Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: const FlutterLogo(size: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
