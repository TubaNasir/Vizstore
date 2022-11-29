import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/constants.dart';

import '../../widgets/form_field.dart';
import '../../widgets/suffix_icon.dart';

class CheckoutForm extends StatefulWidget {
  const CheckoutForm({Key? key}) : super(key: key);

  @override
  State<CheckoutForm> createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  String dropdownvalue = 'Karachi';
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerAddress = TextEditingController();
    TextEditingController controllerContact = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(children: [
        SizedBox(height: 15),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Name",
            hintText: "Enter your name",
            enabled: enabled,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: SuffixIcon(icon: Icons.person),
          ),
          controller: controllerName,
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
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Address",
            hintText: "Enter your address",
            enabled: enabled,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: SuffixIcon(icon: Icons.location_on),
          ),
          controller: controllerAddress,
        ),
        SizedBox(height: 20),
        Stack(children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "City",
              enabled: enabled,
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          Container(
            height: 64,
            padding: const EdgeInsets.only(left: 40.0, right: 20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.0),
                ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                iconDisabledColor: Colors.white,
                iconEnabledColor: Colors.white,
                borderRadius: BorderRadius.circular(28),
                isExpanded: true,
                value: dropdownvalue,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: SecondaryColor,
                ),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
          ),
        ]),
        SizedBox(height: 20),
      ]),
    );
  }
}
