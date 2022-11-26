import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/signup/widgets/register_message.dart';
import 'package:flutterdemo/screens/signup/widgets/signup_form.dart';
import 'package:flutterdemo/screens/signup/widgets/signup_redirection.dart';

import '../widgets/form_field.dart';

class SignUp extends StatefulWidget {
  final CameraDescription camera;
  const SignUp({required this.camera,super.key});

  @override
  State<SignUp> createState() => _SignUpState(camera);
}

class _SignUpState extends State<SignUp> {
  final CameraDescription camera;
  _SignUpState(this.camera);

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
                  SizedBox(height: 40),
                  RegisterMessage(),
                  SizedBox(height: 20),
                  SignUpForm(camera: camera,),
                  SizedBox(height: 20),
                  SignupRedirection(camera: camera),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



