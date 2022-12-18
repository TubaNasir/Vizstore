import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/signup/widgets/register_message.dart';
import 'package:flutterdemo/screens/signup/widgets/signup_form.dart';
import 'package:flutterdemo/screens/signup/widgets/signup_redirection.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

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
                  SizedBox(height: 30),
                  RegisterMessage(),
                  SizedBox(height: 10),
                  SignUpForm(),
                  SizedBox(height: 15),
                  SignupRedirection(),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



