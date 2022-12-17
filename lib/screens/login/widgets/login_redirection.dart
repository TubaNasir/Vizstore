import 'package:flutterdemo/screens/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/signup/signup.dart';

class LoginRedirection extends StatelessWidget {
  const LoginRedirection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?"),
        InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            },
            child: Text(" Signup.", style: TextStyle(color: PrimaryColor))),
      ],
    );
  }
}