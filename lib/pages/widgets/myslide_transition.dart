import 'package:flutter/material.dart';

class MySlideTransition extends StatefulWidget {
  @override
  _MySlideTransitionState createState() => _MySlideTransitionState();
}

class _MySlideTransitionState extends State<MySlideTransition> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(
    CurvedAnimation(parent: _controller, curve: Curves.elasticIn),
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
        Text('SlideTransition'),
        Container(
          height: 200,
          child: SlideTransition(
            position: _offsetAnimation,
            child: FlutterLogo(size: 150),
          ),
        ),
      ],
    );
  }
}
