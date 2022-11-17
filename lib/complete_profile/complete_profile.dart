import 'package:camera/camera.dart';
import 'package:flutterdemo/complete_profile/widgets/complete_profile_message.dart';
import 'package:flutterdemo/complete_profile/widgets/profile_form.dart';
import 'package:flutter/material.dart';

import '../widgets/form_field.dart';

class CompleteProfile extends StatefulWidget {
  final CameraDescription camera;
  const CompleteProfile({required this.camera, super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState(camera);
}

class _CompleteProfileState extends State<CompleteProfile> {
  final CameraDescription camera;
  _CompleteProfileState(this.camera);

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
                  SizedBox(height: 80),
                  CompleteProfileMessage(),
                  SizedBox(height: 40),
                  ProfileForm(
                    camera: camera,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
