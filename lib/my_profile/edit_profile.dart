import 'package:flutterdemo/my_profile/widgets/edit_profile_form.dart';
import 'package:flutterdemo/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import '../widgets/button.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "My Profile", backButton: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          child: EditProfileForm(enabled: false,),
        ),
      ),
    );
  }
}

