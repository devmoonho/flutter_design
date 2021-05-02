import 'package:flutter/material.dart';

class MyAnimatedModalBarrier extends StatefulWidget {
  @override
  _MyAnimatedModalBarrierState createState() => _MyAnimatedModalBarrierState();
}

class _MyAnimatedModalBarrierState extends State<MyAnimatedModalBarrier> with TickerProviderStateMixin {
  late Widget _animatedModalBarrier;
  late AnimationController _animationController;
  late Animation<Color?> _colorTweenAnimation;

  @override
  void initState() {
    super.initState();
    ColorTween _colorTween = ColorTween(begin: Colors.blue, end: Colors.red);
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _colorTweenAnimation = _colorTween.animate(_animationController);

    _animatedModalBarrier = AnimatedModalBarrier(
      color: _colorTweenAnimation,
    );
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('animatedModalBarrier'),
          Container(height: 200, width: 200, child: _animatedModalBarrier),
        ],
      ),
    );
  }
}
