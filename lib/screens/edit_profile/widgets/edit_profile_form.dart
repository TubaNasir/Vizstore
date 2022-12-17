import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/edit_profile_provider.dart';
import 'package:flutterdemo/models/user_json.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutterdemo/screens/widgets/custom_button.dart';
import 'package:flutterdemo/screens/widgets/suffix_icon.dart';
import 'package:provider/provider.dart';

class EditProfileForm extends StatefulWidget {
  EditProfileForm({Key? key}) : super(key: key);

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) async => {context.read<EditProfileProvider>().getUser()});
  }

  @override
  Widget build(BuildContext context) {
    bool enabled = context.watch<EditProfileProvider>().enabled;
    UserJson user = context.watch<EditProfileProvider>().user;
    TextEditingController emailController =
        TextEditingController(text: user.email);
    TextEditingController firstNameController =
        TextEditingController(text: user.firstName);
    TextEditingController lastNameController =
        TextEditingController(text: user.lastName);
    TextEditingController contactController =
        TextEditingController(text: user.contact);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
            style: TextStyle(color: SecondaryDarkColor),
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
              enabled: false,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: SuffixIcon(icon: Icons.email),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            style: enabled == false
                ? TextStyle(color: Color(0xFF9E9E9E))
                : TextStyle(color: SecondaryDarkColor),
            controller: firstNameController,
            decoration: InputDecoration(
              labelText: "First Name",
              enabled: enabled,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: SuffixIcon(icon: Icons.person),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            style: enabled == false
                ? TextStyle(color: Color(0xFF9E9E9E))
                : TextStyle(color: SecondaryDarkColor),
            controller: lastNameController,
            decoration: InputDecoration(
              labelText: "Last Name",
              enabled: enabled,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: SuffixIcon(icon: Icons.person),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            style: enabled == false
                ? TextStyle(color: Color(0xFF9E9E9E))
                : TextStyle(color: SecondaryDarkColor),
            controller: contactController,
            decoration: InputDecoration(
              labelText: "Contact Number",
              enabled: enabled,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: SuffixIcon(icon: Icons.phone_android),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          enabled == false
              ? CustomButton(
                  text: "Edit",
                  pressed: () {
                    context.read<EditProfileProvider>().setEnabled(true);
                  })
              : CustomButton(
                  text: "Save",
                  pressed: () {
                    context.read<EditProfileProvider>().editProfile(
                        firstNameController.text,
                        lastNameController.text,
                        contactController.text);
                    context.read<EditProfileProvider>().setEnabled(false);
                  }),
        ],
      ),
    );
  }
}
