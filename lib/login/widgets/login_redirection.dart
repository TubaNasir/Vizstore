import 'package:camera/camera.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/signup/signup.dart';
import 'package:flutter/material.dart';

class LoginRedirection extends StatelessWidget {
  final CameraDescription camera;
  const LoginRedirection({required this.camera,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?"),
        InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SignUp(camera: camera,)),
              );
            },
            child: Text(" Signup.", style: TextStyle(color: PrimaryColor))),
      ],
    );
  }
}