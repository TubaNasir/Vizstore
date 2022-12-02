import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/login/login.dart';
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

  @override
  Widget build(BuildContext context) {
    bool passwordVisible = context.watch<LoginProvider>().passwordVisible;
    bool error = context.watch<LoginProvider>().errorMessage;

    return Form(
      child: Column(
        children: [
          TextFormField(
            onChanged: (text){
              error = false;

            },
            onTap: (){
            //  context.read<LoginProvider>().changeErrorMessage();
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
                  icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  context.read<LoginProvider>().changePasswordVisible();
                },),
            ),
            controller: controllerPassword,
            obscureText: !passwordVisible,
          ),
          error ? Column(
            children: [
              SizedBox(height: 5),
              Text('Incorrect email or password', style: TextStyle(color: Colors.red, fontSize: 15),),
            ],
          ) :SizedBox(height: 0,),
          SizedBox(height: 30),
          CustomButton(
              text: "Continue",
              pressed: ()  async {
                try {
                  await context.read<LoginProvider>().signIn(controllerEmail.text, controllerPassword.text);
                  // UserCredential userCred = await firebaseauth
                  //     .signInWithEmailAndPassword(email: controllerEmail.text,
                  //     password: controllerPassword.text);
                  // String? user = firebaseauth.currentUser?.uid;


                  Navigator.of(context).push(
                     MaterialPageRoute(
                      builder: (context) =>
                          Home(),
                    ),
                  );
                }
                catch (e) {
                  setState(() {
                    context.read<LoginProvider>().changeErrorMessage();
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
