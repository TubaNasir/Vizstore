import 'package:flutter/material.dart';

class RegisterMessage extends StatelessWidget {
  const RegisterMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Register Account",
      style: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}