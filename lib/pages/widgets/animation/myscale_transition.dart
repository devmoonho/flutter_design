import 'package:flutter/material.dart';

class MyScaleTransition extends StatefulWidget {
  @override
  _MyScaleTransitionState createState() => _MyScaleTransitionState();
}

class _MyScaleTransitionState extends State<MyScaleTransition> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('ScaleTransition'),
        Container(
          height: 200,
          child: ScaleTransition(
            scale: _animation,
            child: FlutterLogo(size: 150),
          ),
        ),
      ],
    );
  }
}
