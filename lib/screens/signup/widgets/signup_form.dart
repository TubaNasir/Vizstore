import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/signup/widgets/social_card.dart';

import '../../complete_profile/complete_profile.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/form_field.dart';
import '../../widgets/suffix_icon.dart';

class SignUpForm extends StatefulWidget {
  final CameraDescription camera;
  const SignUpForm({required this.camera, super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState(camera);
}

class _SignUpFormState extends State<SignUpForm> {
  bool enabled = true;
  final CameraDescription camera;
  _SignUpFormState(this.camera);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
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
          SizedBox(
            height: 20,
          ),
          CustomFormField(
            labelText: "Confirm Password",
            hintText: "Re-enter password",
            icon: SuffixIcon(icon: Icons.person),
            enabled: enabled,
          ),
          SizedBox(
            height: 30,
          ),
          CustomButton(
              text: "Continue",
              pressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CompleteProfile(
                      camera: camera,
                    ),
                  ),
                );
              }),
          SizedBox(height: 10),
          Text(
            'By continuing, you confirm that you agree \nwith our Terms and Conditions',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(height: 30),
          Text(
            "or signin with",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          ]),
        ],
      ),
    );
  }
}
