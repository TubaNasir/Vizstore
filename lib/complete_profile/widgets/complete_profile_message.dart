import 'package:flutter/material.dart';

class CompleteProfileMessage extends StatelessWidget {
  const CompleteProfileMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Complete Profile",
      style: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
