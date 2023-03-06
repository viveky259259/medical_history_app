import 'package:flutter/material.dart';

class MiddleItemCustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
        size.width * 0.15, size.height, size.width * 0.25, size.height / 2);
    path.quadraticBezierTo(size.width * 0.35, 0, size.width * 0.5, 0);
    path.quadraticBezierTo(
        size.width * 0.65, 0, size.width * 0.75, size.height / 2);
    path.quadraticBezierTo(
        size.width * 0.85, size.height, size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
