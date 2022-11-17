import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.pressed,
  }) : super(key: key);
  final String text;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/2,
      height: 70,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        onPressed: pressed,
        child: Ink(
          decoration: const BoxDecoration(
            color: Colors.white,
            gradient: PrimaryGradientColor,
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
