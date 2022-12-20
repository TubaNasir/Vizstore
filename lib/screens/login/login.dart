import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/login_provider.dart';
import 'package:flutterdemo/screens/login/widgets/logo.dart';
import 'package:flutterdemo/screens/widgets/loader.dart';
import 'package:flutterdemo/screens/login/widgets/login_form.dart';
import 'package:flutterdemo/screens/login/widgets/login_redirection.dart';
import 'package:flutterdemo/screens/login/widgets/welcome_message.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  _LoginState();

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<LoginProvider>().isLoading;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Logo(),
                      SizedBox(height: 20),
                      WelcomeMessage(),
                      SizedBox(height: 30),
                      LoginForm(),
                      SizedBox(height: 5),
                      LoginRedirection(),
                    ],
                  ),
                  if (isLoading)
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.5,
                        left: MediaQuery.of(context).size.width * 0.40,
                        child: Loader())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


