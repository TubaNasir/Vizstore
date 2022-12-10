import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/signup/widgets/social_card.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../../controllers/signup_provider.dart';
import '../../complete_profile/complete_profile.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/suffix_icon.dart';
import 'package:http/http.dart' as http;


class SignUpForm extends StatefulWidget {

  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool enabled = true;

  String _contactText = '';
  FirebaseAuth firebaseauth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();
    TextEditingController controllerRePassword = TextEditingController();

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                enabled: enabled,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: SuffixIcon(icon: Icons.email),
              ),
              controller: controllerEmail,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                enabled: enabled,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: SuffixIcon(icon: Icons.person),
              ),
              controller: controllerPassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Confirm Password",
                hintText: "Re-enter password",
                enabled: enabled,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: SuffixIcon(icon: Icons.person),
              ),
              controller: controllerRePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please re-enter your password';
                }
                if(value != controllerPassword.text) {
                  return 'Please make sure your passwords match';
                }
                return null;
              },
              obscureText: true,
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
                text: "Continue",
                pressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      User? user = await context
                          .read<SignupProvider>()
                          .signUp(
                          controllerEmail.text, controllerPassword.text);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              CompleteProfile(user: user),
                        ),
                      );
                    } catch (e) {
                      print(e);
                    }
                  }
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
      ),
    );
  }
}
