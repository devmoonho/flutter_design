import 'package:flutter/material.dart';

class MyAnimatedPhysicalModel extends StatefulWidget {
  @override
  _MyAnimatedPhysicalModelState createState() => _MyAnimatedPhysicalModelState();
}

class _MyAnimatedPhysicalModelState extends State<MyAnimatedPhysicalModel> {
  double _elevation = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _elevation = _elevation == 0 ? 30.0 : 0;
        });
      },
      child: Column(
        children: [
          Text('AnimatedPhysicalModel'),
          Container(
            height: 200,
            width: 200,
            child: AnimatedPhysicalModel(
              elevation: _elevation,
              curve: Curves.fastOutSlowIn,
              borderRadius:
                  _elevation == 0 ? BorderRadius.all(Radius.circular(0)) : BorderRadius.all(Radius.circular(10)),
              color: Colors.blue,
              duration: Duration(milliseconds: 500),
              shadowColor: Colors.black,
              shape: BoxShape.rectangle,
              child: FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }
}
