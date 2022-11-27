import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../home/home.dart';
import '../../signup/widgets/social_card.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/form_field.dart';
import '../../widgets/suffix_icon.dart';

class LoginForm extends StatefulWidget {
  final CameraDescription camera;

  const LoginForm({required this.camera, super.key});

  @override
  State<LoginForm> createState() => _LoginFormState(camera);
}

class _LoginFormState extends State<LoginForm> {
  bool enabled = true;
  bool error = false;
  bool _passwordVisible = false;
  final CameraDescription camera;
  FirebaseAuth firebaseauth = FirebaseAuth.instance;

  _LoginFormState(this.camera);
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Form(
      child: Column(
        children: [
          TextFormField(
            onChanged: (text){
              setState(() {
                error = false;
              });
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              enabled: enabled,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: SuffixIcon(icon: Icons.email),
            ),
            controller: controllerEmail,
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
                  icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },),
            ),
            controller: controllerPassword,
            obscureText: !_passwordVisible,
          ),
          error ? Column(
            children: [
              SizedBox(height: 5),
              Text('Incorrect email or password', style: TextStyle(color: Colors.red, fontSize: 15),),
            ],
          ) :Text(""),
          SizedBox(height: 30),
          CustomButton(
              text: "Continue",
              pressed: () async {
                try {
                  UserCredential userCred = await firebaseauth
                      .signInWithEmailAndPassword(email: controllerEmail.text,
                      password: controllerPassword.text);
                  print(
                      userCred.user?.uid);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          Home(
                            camera: camera,
                          ),
                    ),
                  );
                }
                catch (e) {
                  setState(() {
                    error = true;
                  });
                  print(e); //add incorrect email or pass label if error
                }

                //state mgmt set enabled to tru; if enabled = true, button = save changes
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
            ],
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
