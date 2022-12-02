import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/form_field.dart';
import '../../widgets/suffix_icon.dart';

class EditProfileForm extends StatefulWidget {
  EditProfileForm({Key? key, required this.enabled}) : super(key: key);
  bool enabled;

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}


class _EditProfileFormState extends State<EditProfileForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: Column(
        children: [
          SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "your email",
              enabled: widget.enabled,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: SuffixIcon(icon: Icons.email), //SuffixIcon(icon: Icons.email)
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
              labelText: "First Name",
              hintText: "your first name",
              enabled: widget.enabled,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: SuffixIcon(icon: Icons.person), //SuffixIcon(icon: Icons.email)
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Last Name",
              hintText: "your last name",
              enabled: widget.enabled,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: SuffixIcon(icon: Icons.person), //SuffixIcon(icon: Icons.email)
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Contact Number",
              hintText: "your contact",
              enabled: widget.enabled,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: SuffixIcon(icon: Icons.phone_android), //SuffixIcon(icon: Icons.email)
            ),
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
      ),
    );
  }
}
