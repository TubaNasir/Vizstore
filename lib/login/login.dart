import 'package:camera/camera.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/login/widgets/login_form.dart';
import 'package:flutterdemo/login/widgets/welcome_message.dart';
import 'package:flutterdemo/login/widgets/login_redirection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  final CameraDescription camera;
  const Login({required this.camera, super.key});

  @override
  State<Login> createState() => _LoginState(camera);
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  final CameraDescription camera;
  _LoginState(this.camera);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  WelcomeMessage(),
                  SizedBox(height: 50),
                  LoginForm(
                    camera: camera,
                  ),
                  SizedBox(height: 20),
                  LoginRedirection(
                    camera: camera,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


