import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/login/widgets/login_form.dart';
import 'package:flutterdemo/screens/login/widgets/login_redirection.dart';
import 'package:flutterdemo/screens/login/widgets/welcome_message.dart';

class Login extends StatefulWidget {
  const Login({ super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  _LoginState();

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
                  LoginForm(),
                  SizedBox(height: 20),
                  LoginRedirection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


