import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 115,
        width: 115,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://i1.pickpik.com/photos/528/587/667/bloom-blossom-blur-close-up-preview.jpg'),
        ),
      ),
    );
  }
}