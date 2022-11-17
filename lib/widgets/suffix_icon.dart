import 'package:flutter/material.dart';

class SuffixIcon extends StatelessWidget {
  const SuffixIcon({
    Key? key,
    required this.icon
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
      child: Icon(icon),
    );
  }
}