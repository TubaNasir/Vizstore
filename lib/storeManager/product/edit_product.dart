import 'package:flutterdemo/home/home_model.dart';
import 'package:flutterdemo/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/form_field.dart';
import '../../widgets/suffix_icon.dart';

class EditProduct extends StatelessWidget {
  const EditProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Edit Product",
          backButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height*0.23,
                    decoration: BoxDecoration(
                      //color: SecondaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                    ),
                    child: Image.network(demoProducts[0].image)
                ),
                AddProductForm(),
              ],
            ),
          ),
        )
    );
  }
}

class AddProductForm extends StatefulWidget {
  const AddProductForm({Key? key}) : super(key: key);

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {

  bool enabled = false;
  String dropdownValue = "Clothing";
  List<String> categories = [
    "Clothing",
    "Electronics",
    "Groceries",
    "Sports",
    "Beauty"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: DropdownButtonFormField<String>(
            borderRadius: BorderRadius.circular(15),
            iconSize: 42.0,
            iconEnabledColor: PrimaryColor,
            value: dropdownValue,
            items: categories.map<DropdownMenuItem<String>>((value) =>
            (
                DropdownMenuItem(value: value, child: Text(value, style: Theme.of(context).textTheme.titleMedium,),)
            )).toList(),
            onChanged: enabled ? (value) =>
            (
                setState(() {
                  dropdownValue = value!;
                })
            ) : null ,
          ),
        ),
        SizedBox(height: 20,),
        CustomFormField(
          labelText: "Name",
          hintText: "the product name",
          icon: SuffixIcon(icon: Icons.abc),
          enabled: enabled,
        ),
        SizedBox(height: 20,),
        CustomFormField(
          labelText: "Price",
          hintText: "the price",
          icon: SuffixIcon(icon: Icons.monetization_on),
          enabled: enabled,
        ),
        SizedBox(height: 20,),
        CustomFormField(
          labelText: "Description",
          hintText: "the description",
          icon: SuffixIcon(icon: Icons.description),
          enabled: enabled,
        ),
        SizedBox(height: 20,),
        CustomFormField(
          labelText: "Inventory",
          hintText: "the inventory",
          icon: SuffixIcon(icon: Icons.inventory),
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

