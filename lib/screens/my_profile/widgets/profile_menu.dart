import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
    required this.iconRight,
  }) : super(key: key);

  final String text;
  final Icon icon, iconRight;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              iconRight
            ],
          ),
        ),
      ),
    );
  }
}