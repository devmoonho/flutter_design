import 'package:flutter/material.dart';

class MyFadeTransition extends StatefulWidget {
  @override
  _MyFadeTransitionState createState() => _MyFadeTransitionState();
}

class _MyFadeTransitionState extends State<MyFadeTransition> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('FadeTransition'),
        Container(
          height: 200,
          width: 200,
          color: Colors.white,
          child: FadeTransition(
            opacity: _animation,
            child: const FlutterLogo(),
          ),
        ),
      ],
    );
  }
}
