import 'dart:math' as math;
import 'package:flutter/material.dart';

class MyAnimatedBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAnimatedBuilder();
}

class _MyAnimatedBuilder extends State<MyAnimatedBuilder> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('AnimatedBuilder'),
        AnimatedBuilder(
          animation: _controller,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
            child: const Center(
              child: Text('Whee'),
            ),
          ),
          builder: (_, Widget? child) {
            return Transform.rotate(
              angle: _controller.value * 4 * math.pi,
              child: child,
            );
          },
        ),
      ],
    );
  }
}
