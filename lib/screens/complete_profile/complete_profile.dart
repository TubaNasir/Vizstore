import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/complete_profile_provider.dart';
import 'package:flutterdemo/screens/complete_profile/widgets/complete_profile_message.dart';
import 'package:flutterdemo/screens/complete_profile/widgets/profile_form.dart';
import 'package:flutterdemo/screens/widgets/loader.dart';
import 'package:provider/provider.dart';

class CompleteProfile extends StatefulWidget {
  final User? user;
  const CompleteProfile({super.key, required this.user});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {

  @override
  Widget build(BuildContext context) {

    bool isLoading = context.watch<CompleteProfileProvider>().isLoading;

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
                      SizedBox(height: 80),
                      CompleteProfileMessage(),
                      SizedBox(height: 40),
                      ProfileForm(
                        user: widget.user
                      ),
                      SizedBox(height: 20),
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
