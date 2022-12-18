import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/signup_provider.dart';
import 'package:flutterdemo/screens/signup/widgets/register_message.dart';
import 'package:flutterdemo/screens/signup/widgets/signup_form.dart';
import 'package:flutterdemo/screens/signup/widgets/signup_redirection.dart';
import 'package:flutterdemo/screens/widgets/loader.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {

    bool isLoading = context.watch<SignupProvider>().isLoading;

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
                      SizedBox(height: 30),
                      RegisterMessage(),
                      SizedBox(height: 10),
                      SignUpForm(),
                      SizedBox(height: 15),
                      SignupRedirection(),
                      SizedBox(height: 15),
                    ],
                  ),
                  if(isLoading)
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.5,
                        left: MediaQuery.of(context).size.width * 0.40,
                        child: Loader()
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



