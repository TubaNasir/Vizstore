import 'package:flutterdemo/widgets/customAppBar.dart';
import 'package:flutterdemo/widgets/suffix_icon.dart';
import 'package:flutterdemo/widgets/form_field.dart';
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
          child: EditProfileForm(),
        ),
      ),
    );
  }
}

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

bool enabled = false;

class _EditProfileFormState extends State<EditProfileForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        CustomFormField(
          labelText: "Email",
          hintText: "your email",
          icon: SuffixIcon(icon: Icons.email),
          enabled: enabled,
        ),
        SizedBox(height: 20,),
        CustomFormField(
          labelText: "First Name",
          hintText: "your first name",
          icon: SuffixIcon(icon: Icons.person),
          enabled: enabled,
        ),
        SizedBox(height: 20,),
        CustomFormField(
          labelText: "Last Name",
          hintText: "your last name",
          icon: SuffixIcon(icon: Icons.person),
          enabled: enabled,
        ),
        SizedBox(height: 20,),
        CustomFormField(
          labelText: "Contact Number",
          hintText: "your contact number",
          icon: SuffixIcon(icon: Icons.phone_android),
          enabled: enabled,
        ),
        SizedBox(height: 20,),
        // if enabled=true ? button text = save changed : edit
        CustomButton(
            text: "Edit",
            pressed: () {
              print('hello');
              //state mgmt set enabled to tru; if enabled = true, button = save changes
            }),
      ],
    );
  }
}
