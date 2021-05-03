import 'package:design/pages/widgets/animation/myanimated_align.dart';
import 'package:design/pages/widgets/animation/myanimated_builder.dart';
import 'package:design/pages/widgets/animation/myanimated_container.dart';
import 'package:design/pages/widgets/animation/myanimated_crossfade.dart';
import 'package:design/pages/widgets/animation/myanimated_defaluttextstyle.dart';
import 'package:design/pages/widgets/animation/myanimated_list.dart';
import 'package:design/pages/widgets/animation/myanimated_modalbarrier.dart';
import 'package:design/pages/widgets/animation/myanimated_opacity.dart';
import 'package:design/pages/widgets/animation/myanimated_physicalmodel.dart';
import 'package:design/pages/widgets/animation/myanimated_positioned.dart';
import 'package:design/pages/widgets/animation/myanimated_size.dart';
import 'package:design/pages/widgets/animation/myanimated_widget.dart';
import 'package:design/pages/widgets/animation/mydecoratedbox_transition.dart';
import 'package:design/pages/widgets/animation/myfade_transition.dart';
import 'package:design/pages/widgets/animation/myhero.dart';
import 'package:design/pages/widgets/animation/mypositioned_transition.dart';
import 'package:design/pages/widgets/animation/myrotation_transition.dart';
import 'package:design/pages/widgets/animation/myscale_transition.dart';
import 'package:design/pages/widgets/animation/mysize_transition.dart';
import 'package:design/pages/widgets/animation/myslide_transition.dart';
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
