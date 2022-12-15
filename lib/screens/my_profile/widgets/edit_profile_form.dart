import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/edit_profile_provider.dart';
import 'package:flutterdemo/models/user_model.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/suffix_icon.dart';

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
    context.read<EditProfileProvider>().getUser();
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
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
              //hintText: user.email,
              enabled: enabled,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon:
                  SuffixIcon(icon: Icons.email), //SuffixIcon(icon: Icons.email)
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: firstNameController,
            decoration: InputDecoration(
              labelText: "First Name",
              hintText: user.firstName,
              enabled: enabled,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: SuffixIcon(
                  icon: Icons.person), //SuffixIcon(icon: Icons.email)
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: lastNameController,
            decoration: InputDecoration(
              labelText: "Last Name",
              hintText: user.lastName,
              enabled: enabled,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: SuffixIcon(
                  icon: Icons.person), //SuffixIcon(icon: Icons.email)
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: contactController,
            decoration: InputDecoration(
              labelText: "Contact Number",
              hintText: user.contact,
              enabled: enabled,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: SuffixIcon(
                  icon: Icons.phone_android), //SuffixIcon(icon: Icons.email)
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // if enabled=true ? button text = save changed : edit
          enabled == false
              ? CustomButton(
                  text: "Edit",
                  pressed: () {
                    context.read<EditProfileProvider>().setEnabled(true);

                    //state mgmt set enabled to tru; if enabled = true, button = save changes
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
