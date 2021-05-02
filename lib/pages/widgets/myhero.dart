import 'package:flutter/material.dart';

import '../hero_page.dart';

class MyHero extends StatefulWidget {
  @override
  _MyHeroState createState() => _MyHeroState();
}

class _MyHeroState extends State<MyHero> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hero'),
        Row(
          children: [
            Hero(
              tag: 'imageHero',
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return HeroPage();
                  }));
                },
                child: FlutterLogo(size: 50),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
