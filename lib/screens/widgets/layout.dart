import 'package:flutterdemo/screens/constants.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key, required this.widget}) : super(key: key);

  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: this.widget,
            ),
          ),
        ],
      ),
    );
  }
}
