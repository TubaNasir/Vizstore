import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/complete_profile/widgets/complete_profile_message.dart';
import 'package:flutterdemo/screens/complete_profile/widgets/profile_form.dart';

import '../widgets/form_field.dart';

class CompleteProfile extends StatefulWidget {
  final CameraDescription camera;
  final String? uid;
  const CompleteProfile({required this.camera, super.key, required this.uid});

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
                    uid: widget.uid
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
