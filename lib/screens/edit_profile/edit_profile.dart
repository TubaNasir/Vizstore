import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/edit_profile/widgets/edit_profile_form.dart';
import 'package:flutterdemo/screens/widgets/custom_app_bar.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "My Profile",
          backButton: true,
        ),
        body: SingleChildScrollView(
          child: EditProfileForm(),
        ),
      ),
    );
  }
}
