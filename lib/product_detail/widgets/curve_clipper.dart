import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    Offset curvepoint1 = Offset(0, size.height * 0.825);
    Offset centerpoint = Offset(size.width * 0.25, size.height * 0.825);
    path.quadraticBezierTo(curvepoint1.dx, curvepoint1.dy, centerpoint.dx, centerpoint.dy);
    path.lineTo(size.width * 0.75, size.height * 0.825);
    Offset curvepoint2 = Offset(size.width, size.height * 0.825);
    Offset centerpoint2 = Offset(size.width, size.height * 0.658);
    path.quadraticBezierTo(curvepoint2.dx, curvepoint2.dy, centerpoint2.dx, centerpoint2.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
  
}