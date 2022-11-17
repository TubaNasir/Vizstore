import 'dart:async';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  var counter = 0;

  List<Color> get getColorsList => [
    const Color(0xFFFCFAFA),
    const Color(0xFFF8CB2E),
    const Color(0x211A1A1A),
    const Color(0xCF090808),
  ]..shuffle();

  List<Alignment> get getAlignments => [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];

  _startBgColorAnimationTimer() {
    ///Animating for the first time.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      counter++;
      setState(() {});
    });

    const interval = Duration(seconds: 5);
    Timer.periodic(
      interval,
          (Timer timer) {
        counter++;
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _startBgColorAnimationTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: getAlignments[counter % getAlignments.length],
                end: getAlignments[(counter + 2) % getAlignments.length],
                colors: getColorsList,
                tileMode: TileMode.clamp,
              ),
            ),
            duration: const Duration(seconds: 4),
          ),
          Container(height: MediaQuery.of(context).size.height),
        ],
      ),
    );
  }
}