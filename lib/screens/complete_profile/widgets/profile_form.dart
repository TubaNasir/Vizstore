import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/complete_profile_provider.dart';
import 'package:flutterdemo/screens/home/home.dart';
import 'package:flutterdemo/screens/login/login.dart';
import 'package:flutterdemo/screens/widgets/custom_button.dart';
import 'package:flutterdemo/screens/widgets/suffix_icon.dart';
import 'package:provider/provider.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key, required this.user});

  final User? user;

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  bool enabled = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerFname = TextEditingController();
    TextEditingController controllerLname = TextEditingController();
    TextEditingController controllerContact = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your contact number';
              } else if (!RegExp(r"^\+?0[0-9]{10}$").hasMatch(value)) {
                return 'Please enter a valid contact';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
              text: "Sign Up",
              pressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<CompleteProfileProvider>().addNewUser(
                      widget.user,
                      controllerFname.text,
                      controllerLname.text,
                      controllerContact.text);
                  if (widget.user!.providerData[0].providerId
                      .toLowerCase()
                      .contains('google')) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  }
                }
              }),
        ],
      ),
    );
  }
}
