import 'package:design/pages/clipping_page.dart';
import 'package:flutter/material.dart';

import 'animation_page.dart';
import 'painter_page.dart';

class TabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('Painter'),
                ),
                Tab(
                  child: Text('Clipping'),
                ),
                Tab(
                  child: Text('Animation'),
                ),
              ],
            ),
            title: Text('Flutter Design Base Code'),
          ),
          body: TabBarView(
            children: [
              PainterPage(),
              ClippingPage(),
              AnimationPage(),
            ],
          ),
        ),
      ),
    );
  }
}
