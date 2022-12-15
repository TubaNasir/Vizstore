import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/google_sign_in_provider.dart';
import 'package:flutterdemo/screens/complete_profile/complete_profile.dart';
import 'package:provider/provider.dart';

import '../../../controllers/login_provider.dart';
import '../../home/home.dart';
import '../../signup/widgets/social_card.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/suffix_icon.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool enabled = true;

  //bool error = false;
  FirebaseAuth firebaseauth = FirebaseAuth.instance;

  _LoginFormState();

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool passwordVisible = context.watch<LoginProvider>().passwordVisible;

    return Form(
      key: _formKey,
      child: Column(
        children: [
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
              suffixIcon: IconButton(
                icon: Icon( //visibility_off
                    passwordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  context.read<LoginProvider>().changePasswordVisible();
                },
              ),
            ),
            controller: controllerPassword,
            obscureText: !passwordVisible,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          SizedBox(height: 30),
          CustomButton(
              text: "Continue",
              pressed: () async {
                 Future<bool> login = context
                    .read<LoginProvider>()
                    .signIn(controllerEmail.text, controllerPassword.text);

                if (await login == true) { //_formKey.currentState!.validate() &&
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                }

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
                onPressed: () {
                  User? user = context
                      .read<GoogleSignInProvider>()
                      .googleLogin() as User?;

                  bool exist = context
                      .read<GoogleSignInProvider>()
                      .doesUserExist() as bool;
                  if (!exist) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CompleteProfile(
                          user: user,
                        ),
                      ),
                    );
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  }
                },
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
