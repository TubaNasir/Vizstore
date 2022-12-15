import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/my_profile/widgets/edit_profile_form.dart';
import '../widgets/custom_app_bar/custom_app_bar.dart';
import '../widgets/custom_button.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: "My Profile", backButton: true,),
        body: SingleChildScrollView(
          child: EditProfileForm(),
        ),
      ),
    );
  }
}

