import 'package:design/pages/widgets/clipping/myclipoval.dart';
import 'package:design/pages/widgets/clipping/myclippath.dart';
import 'package:design/pages/widgets/clipping/myclipprrect.dart';
import 'package:design/pages/widgets/clipping/mycliprect.dart';
import 'package:flutter/material.dart';

class ClippingPage extends StatefulWidget {
  @override
  _ClippingPageState createState() => _ClippingPageState();
}

class _ClippingPageState extends State<ClippingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyClipRect(),
              MyClipRRect(),
              MyClipOval(),
              MyClipPath(),
            ].map((e) => Padding(padding: const EdgeInsets.all(20), child: e)).toList(),
          ),
        ),
      ),
    );
  }
}
