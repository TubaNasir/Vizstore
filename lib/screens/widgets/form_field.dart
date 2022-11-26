import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/widgets/suffix_icon.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.icon,
    required this.enabled,
  }) : super(key: key);

  final String labelText, hintText;
  final SuffixIcon icon;
  final bool enabled;

  //final VoidCallback enable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            enabled: enabled,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: icon, //SuffixIcon(icon: Icons.email)
          ),
        ),
      ],
    );
  }
}
