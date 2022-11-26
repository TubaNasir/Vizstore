import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../login/login.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/form_field.dart';
import '../../widgets/suffix_icon.dart';

class ProfileForm extends StatefulWidget {
  final CameraDescription camera;
  const ProfileForm({required this.camera, super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState(camera);
}

bool enabled = true;

class _ProfileFormState extends State<ProfileForm> {
  final CameraDescription camera;
  _ProfileFormState(this.camera);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        CustomFormField(
          labelText: "First Name",
          hintText: "Enter your first name",
          icon: SuffixIcon(icon: Icons.person),
          enabled: enabled,
        ),
        SizedBox(
          height: 20,
        ),
        CustomFormField(
          labelText: "Last Name",
          hintText: "Enter your last name",
          icon: SuffixIcon(icon: Icons.person),
          enabled: enabled,
        ),
        SizedBox(
          height: 20,
        ),
        CustomFormField(
          labelText: "Contact Number",
          hintText: "Enter your contact number",
          icon: SuffixIcon(icon: Icons.phone_android),
          enabled: enabled,
        ),
        SizedBox(
          height: 20,
        ),
        CustomButton(
            text: "Sign Up",
            pressed: () {
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
