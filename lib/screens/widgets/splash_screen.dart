import "package:flutter/material.dart";
import 'package:flutterdemo/screens/login/login.dart';
import 'package:video_player/video_player.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = VideoPlayerController.asset("assets/animations/viz.mp4")
      ..initialize().then((value) {
        setState(() {});
      })
      ..setVolume(0.0);

    playVideo();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void playVideo() async {
    controller.play();

    await Future.delayed(const Duration(seconds: 4));

    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(
      builder: (_)=> const Login())
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFCD0A),
      //backgroundColor: Colors.pink,
      body: Center(
        child: controller.value.isInitialized ? 
        AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(
            controller
          ),
        )
        : 
        Container()
      ),
    );
  }
}