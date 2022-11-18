import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/widgets/form_field.dart';
import 'package:flutterdemo/widgets/suffix_icon.dart';

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
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(children: [
        SizedBox(height: 15),
        CustomFormField(
          labelText: "Name",
          hintText: "Enter your name",
          icon: SuffixIcon(icon: Icons.person),
          enabled: enabled,
        ),
        SizedBox(
          height: 20,
        ),
        CustomFormField(
          labelText: "Contact",
          hintText: "Enter your contact",
          icon: SuffixIcon(icon: Icons.phone_android),
          enabled: enabled,
        ),
        SizedBox(height: 20),
        CustomFormField(
          labelText: "Address",
          hintText: "Enter your address",
          icon: SuffixIcon(icon: Icons.location_on),
          enabled: enabled,
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
