import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/login_provider.dart';
import 'package:flutterdemo/screens/complete_profile/complete_profile.dart';
import 'package:flutterdemo/screens/home/home.dart';
import 'package:flutterdemo/screens/signup/widgets/social_card.dart';
import 'package:flutterdemo/screens/widgets/custom_button.dart';
import 'package:flutterdemo/screens/widgets/suffix_icon.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  FirebaseAuth firebaseauth = FirebaseAuth.instance;

  _LoginFormState();

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool enabled = true;
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
                icon: Icon(
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
                if (_formKey.currentState!.validate()) {
                  Future<bool> login = context
                      .read<LoginProvider>()
                      .signIn(controllerEmail.text, controllerPassword.text);
                  if (await login == true) {
                    await context.read<LoginProvider>().sendNotifications();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  }
                }
              }),
          Text(
            "or signin with",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialCard(
                icon: 'assets/icons/google-icon.svg',
                onPressed: () async {
                  UserCredential? user =
                      await context.read<LoginProvider>().googleLogin();

                  if (user!.additionalUserInfo!.isNewUser) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CompleteProfile(
                          user: user.user,
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
            ],
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
