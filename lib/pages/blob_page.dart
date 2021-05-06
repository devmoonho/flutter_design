import 'package:design/pages/widgets/blob/myblob.dart';
import 'package:flutter/material.dart';

class BlobPage extends StatefulWidget {
  @override
  _BlobPageState createState() => _BlobPageState();
}

class _BlobPageState extends State<BlobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyBlob(),
            ].map((e) => Padding(padding: const EdgeInsets.all(20), child: e)).toList(),
          ),
        ),
      ),
    );
  }
}
