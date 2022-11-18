import 'package:flutterdemo/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutterdemo/widgets/suffix_icon.dart';
import 'package:flutterdemo/widgets/form_field.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

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

class EditProfileForm extends StatefulWidget {
  EditProfileForm({Key? key, required this.enabled}) : super(key: key);
  bool enabled;

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}


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
          enabled: widget.enabled,
        ),
        SizedBox(height: 20,),
        CustomFormField(
          labelText: "First Name",
          hintText: "your first name",
          icon: SuffixIcon(icon: Icons.person),
          enabled: widget.enabled,
        ),
        SizedBox(height: 20,),
        CustomFormField(
          labelText: "Last Name",
          hintText: "your last name",
          icon: SuffixIcon(icon: Icons.person),
          enabled: widget.enabled,
        ),
        SizedBox(height: 20,),
        CustomFormField(
          labelText: "Contact Number",
          hintText: "your contact number",
          icon: SuffixIcon(icon: Icons.phone_android),
          enabled: widget.enabled,
        ),
        SizedBox(height: 20,),
        // if enabled=true ? button text = save changed : edit
        widget.enabled == false ?
        CustomButton(
            text: "Edit",
            pressed: () {
              setState(() {
                widget.enabled = true;
              });
              //state mgmt set enabled to tru; if enabled = true, button = save changes
            }) :
        CustomButton(
            text: "Save",
            pressed: () {
              widget.enabled = false;

            }),
      ],
    );
  }
}
