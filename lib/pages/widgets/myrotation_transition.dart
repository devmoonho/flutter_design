import 'package:flutter/material.dart';

class MyRotationTransition extends StatefulWidget {
  @override
  _MyRotationTransitionState createState() => _MyRotationTransitionState();
}

class _MyRotationTransitionState extends State<MyRotationTransition> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Rotation Transition'),
        Container(
          height: 200,
          child: RotationTransition(
            turns: _animation,
            child: FlutterLogo(size: 100),
          ),
        ),
      ],
    );
  }
}
