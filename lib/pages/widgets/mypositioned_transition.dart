import 'package:flutter/material.dart';

class MyPositionedTransition extends StatefulWidget {
  @override
  _MyPositionedTransitionState createState() => _MyPositionedTransitionState();
}

class _MyPositionedTransitionState extends State<MyPositionedTransition> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double small = 100;
    const double big = 200;

    return Column(
      children: [
        Text('PositionedTransition'),
        LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          final Size container = Size(constraints.biggest.width, 400);

          return Container(
            color: Colors.grey[300],
            height: 400,
            width: container.width,
            child: Stack(
              children: [
                PositionedTransition(
                  rect: RelativeRectTween(
                    begin: RelativeRect.fromSize(Rect.fromLTWH(0, 0, small, small), container),
                    end: RelativeRect.fromSize(
                        Rect.fromLTWH(container.width - big, container.height - big, big, big), container),
                  ).animate(
                    CurvedAnimation(parent: _controller, curve: Curves.elasticInOut),
                  ),
                  child: FlutterLogo(),
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}
