import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/images/VizStoreLogo.png",
              height:
              MediaQuery.of(context).size.height * 0.2)),
    );
  }
}