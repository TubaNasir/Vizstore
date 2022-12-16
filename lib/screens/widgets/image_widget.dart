import 'package:flutter/material.dart';

import '../constants.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          //width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: SecondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: Image.network(image,fit: BoxFit.scaleDown, errorBuilder:
                (BuildContext context, Object exception, StackTrace? stackTrace) {
              return const CircularProgressIndicator();
            }),),
      ),
    );
  }
}
