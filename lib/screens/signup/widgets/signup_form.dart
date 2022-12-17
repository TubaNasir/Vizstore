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

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerRePassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    bool passwordVisible = context.watch<SignupProvider>().passwordVisible;
    bool rePasswordVisible = context.watch<SignupProvider>().rePasswordVisible;


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
                else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                  return 'Please enter a valid email address';
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
                suffixIcon: IconButton(
                  icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    context.read<SignupProvider>().changePasswordVisible();
                  },
                ),
              ),
              controller: controllerPassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                else if(value.length < 6) {
                  return 'Password should be at least 6 characters long';
                }
                return null;
              },
              obscureText: !passwordVisible,

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
                suffixIcon: IconButton(
                  icon: Icon(
                      rePasswordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    context.read<SignupProvider>().changeRePasswordVisible();
                  },
                ),
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
              obscureText: !rePasswordVisible,
            ),
            SizedBox(
              height: 25,
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

                      if(user != null){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                CompleteProfile(user: user),
                          ),
                        );
                      }
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
            SizedBox(height: 20),
            Text(
              "or signin with",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SocialCard(
                icon: 'assets/icons/google-icon.svg',
                onPressed: () {},
              ),

            ]),
          ],
        ),
      ),
    );
  }
}
