import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/login_provider.dart';
import '../../../controllers/signup_provider.dart';
import '../../../models/user_model.dart';
import '../../login/login.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/suffix_icon.dart';

class ProfileForm extends StatefulWidget {
  final CameraDescription camera;
  final String? uid;

  const ProfileForm({required this.camera, super.key, this.uid});


  @override
  State<ProfileForm> createState() => _ProfileFormState(camera);
}

bool enabled = true;

class _ProfileFormState extends State<ProfileForm> {
  final CameraDescription camera;

  _ProfileFormState(this.camera);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerFname = TextEditingController();
    TextEditingController controllerLname = TextEditingController();
    TextEditingController controllerContact = TextEditingController();
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "First Name",
            hintText: "Enter your first name",
            enabled: enabled,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: SuffixIcon(icon: Icons.person),
          ),
          controller: controllerFname,
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Last Name",
            hintText: "Enter your last name",
            enabled: enabled,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: SuffixIcon(icon: Icons.person),
          ),
          controller: controllerLname,
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Contact Number",
            hintText: "Enter your contact number",
            enabled: enabled,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: SuffixIcon(icon: Icons.phone_android),
          ),
          controller: controllerContact,
        ),
        SizedBox(
          height: 20,
        ),
        CustomButton(
            text: "Sign Up",
            pressed: () {

              context.read<SignupProvider>().addNewUser(widget.uid, controllerFname.text, controllerLname.text, controllerContact.text);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Login(camera: camera),
                ),
              );
            }),
      ],
    );
  }
}
