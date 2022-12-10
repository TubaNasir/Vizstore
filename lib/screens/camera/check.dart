import 'package:flutter/material.dart';


class Check extends StatefulWidget {
  String greeting;

  Check({super.key, required this.greeting});

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Check"),),
      body: Center(child: Text(widget.greeting)) ,
    );
  }
}