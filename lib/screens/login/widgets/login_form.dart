import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../home/home.dart';
import '../../signup/widgets/social_card.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/form_field.dart';
import '../../widgets/suffix_icon.dart';

class LoginForm extends StatefulWidget {
  final CameraDescription camera;
  const LoginForm({required this.camera, super.key});

  @override
  State<LoginForm> createState() => _LoginFormState(camera);
}

class _LoginFormState extends State<LoginForm> {
  bool enabled = true;
  final CameraDescription camera;

  _LoginFormState(this.camera);
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomFormField(
            labelText: "Email",
            hintText: "Enter your email",
            icon: SuffixIcon(icon: Icons.email),
            enabled: enabled,
          ),
          SizedBox(
            height: 20,
          ),
          CustomFormField(
            labelText: "Password",
            hintText: "Enter your password",
            icon: SuffixIcon(icon: Icons.person),
            enabled: enabled,
          ),
          SizedBox(height: 30),
          CustomButton(
              text: "Continue",
              pressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Home(
                      camera: camera,
                    ),
                  ),
                );
                //state mgmt set enabled to tru; if enabled = true, button = save changes
              }),
          Text(
            "or signup with",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialCard(
                icon: 'assets/icons/google-icon.svg',
                onPressed: () {},
              ),
              SocialCard(
                icon: 'assets/icons/facebook-2.svg',
                onPressed: () {},
              ),
              SocialCard(
                icon: 'assets/icons/twitter.svg',
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
