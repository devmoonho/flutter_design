import 'package:design/pages/widgets/myanimated_align.dart';
import 'package:design/pages/widgets/myanimated_builder.dart';
import 'package:design/pages/widgets/myanimated_container.dart';
import 'package:design/pages/widgets/myanimated_crossfade.dart';
import 'package:design/pages/widgets/myanimated_defaluttextstyle.dart';
import 'package:design/pages/widgets/myanimated_list.dart';
import 'package:design/pages/widgets/myanimated_modalbarrier.dart';
import 'package:design/pages/widgets/myanimated_opacity.dart';
import 'package:design/pages/widgets/myanimated_physicalmodel.dart';
import 'package:design/pages/widgets/myanimated_positioned.dart';
import 'package:design/pages/widgets/myanimated_size.dart';
import 'package:design/pages/widgets/myanimated_widget.dart';
import 'package:design/pages/widgets/mydecoratedbox_transition.dart';
import 'package:design/pages/widgets/myfade_transition.dart';
import 'package:design/pages/widgets/myhero.dart';
import 'package:design/pages/widgets/mypositioned_transition.dart';
import 'package:design/pages/widgets/myrotation_transition.dart';
import 'package:design/pages/widgets/myscale_transition.dart';
import 'package:design/pages/widgets/mysize_transition.dart';
import 'package:design/pages/widgets/myslide_transition.dart';
import 'package:flutter/material.dart';

typedef Callback = void Function(dynamic value);

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MySlideTransition(),
              MySizeTransition(),
              MyScaleTransition(),
              MyRotationTransition(),
              MyPositionedTransition(),
              MyHero(),
              MyFadeTransition(),
              MyDecoratedBoxTransition(),
              MyAnimatedWidget(),
              MyAnimatedSize(),
              MyAnimatedPositioned(),
              MyAnimatedPhysicalModel(),
              MyAnimatedOpacity(),
              MyAnimatedModalBarrier(),
              MyAnimatedList(),
              MyAnimatedDefalutTextStyle(),
              MyAnimatedAlign(),
              MyAnimatedBuilder(),
              MyAnimatedContainer(),
              MyAnimatedCrossFade(),
            ].map((e) => Padding(padding: const EdgeInsets.all(20), child: e)).toList(),
          ),
        ),
      ),
    );
  }
}
