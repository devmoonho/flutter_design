import 'package:design/pages/widgets/myanimated_align.dart';
import 'package:design/pages/widgets/myanimated_builder.dart';
import 'package:design/pages/widgets/myanimated_container.dart';
import 'package:design/pages/widgets/myanimated_crossfade.dart';
import 'package:design/pages/widgets/myanimated_defaluttextstyle.dart';
import 'package:design/pages/widgets/myanimated_list.dart';
import 'package:flutter/material.dart';

typedef Callback = void Function(dynamic value);

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool selectedAlign = false;
  bool selectedContainer = false;
  bool selectedCrossFade = false;
  bool selectedDefalutTextStyle = false;

  refresh(dynamic map) => setState(() {
        selectedDefalutTextStyle = map[MyAnimatedDefalutTextStyle] ?? selectedDefalutTextStyle;
        selectedAlign = map[MyAnimatedAlign] ?? selectedAlign;
        selectedContainer = map[MyAnimatedContainer] ?? selectedContainer;
        selectedCrossFade = map[MyAnimatedCrossFade] ?? selectedCrossFade;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyAnimatedList(),
              MyAnimatedDefalutTextStyle(refresh: refresh, selected: selectedDefalutTextStyle),
              MyAnimatedAlign(refresh: refresh, selected: selectedAlign),
              MyAnimatedBuilder(),
              MyAnimatedContainer(refresh: refresh, selected: selectedContainer),
              MyAnimatedCrossFade(refresh: refresh, selected: selectedCrossFade),
            ].map((e) => Padding(padding: const EdgeInsets.all(20), child: e)).toList(),
          ),
        ),
      ),
    );
  }
}
