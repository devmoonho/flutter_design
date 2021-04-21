import 'package:flutter/material.dart';

import '../animation_page.dart';

class MyAnimatedCrossFade extends StatefulWidget {
  final Callback refresh;
  late final bool selected;

  MyAnimatedCrossFade({required this.refresh, required, required this.selected});
  @override
  State<StatefulWidget> createState() => _MyAnimatedCrossFade();
}

class _MyAnimatedCrossFade extends State<MyAnimatedCrossFade> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.refresh({MyAnimatedCrossFade: !widget.selected});
      },
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Text('AnimatedCrossFade'),
            Container(
              child: AnimatedCrossFade(
                crossFadeState: widget.selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: Duration(seconds: 3),
                firstCurve: Curves.bounceIn,
                secondCurve: Curves.fastOutSlowIn,
                firstChild: _firstWidget(),
                secondChild: _secondWidget(),
              ),
            ),
          ],
        ),
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
