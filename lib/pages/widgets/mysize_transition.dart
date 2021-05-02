import 'package:flutter/material.dart';

class MySizeTransition extends StatefulWidget {
  @override
  _MySizeTransitionState createState() => _MySizeTransitionState();
}

class _MySizeTransitionState extends State<MySizeTransition> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
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
        Text('SizeTransition'),
        Container(
          height: 200,
          child: SizeTransition(
            sizeFactor: _animation,
            axis: Axis.horizontal,
            axisAlignment: 0,
            child: FlutterLogo(size: 150),
          ),
        ),
      ],
    );
  }
}
