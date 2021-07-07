import 'package:flutter/material.dart';

class DeliveryFormStepClipStart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = size.width / 6;
    var path = Path();
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.lineTo((size.width * 0.75) - radius, 0);
    path.quadraticBezierTo(
      (size.width * 0.75) - radius / 4,
      0,
      size.width * 0.75,
      radius / 3,
    );
    path.lineTo(size.width - (radius / 4), (size.height / 2) - (radius / 3));
    path.quadraticBezierTo(
      size.width,
      size.height / 2,
      size.width - (radius / 4),
      (size.height / 2) + (radius / 3),
    );
    path.lineTo(size.width * 0.75, size.height - (radius / 3));
    path.quadraticBezierTo(
      (size.width * 0.75) - radius / 4,
      size.height,
      (size.width * 0.75) - radius,
      size.height,
    );
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DeliveryFormStepClipOther extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = size.width / 6;
    var path = Path();
    path.lineTo(radius / 2, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.lineTo((size.width * 0.75) - radius, 0);
    path.quadraticBezierTo(
      (size.width * 0.75) - radius / 4,
      0,
      size.width * 0.75,
      radius / 3,
    );
    path.lineTo(size.width - (radius / 4), (size.height / 2) - (radius / 3));
    path.quadraticBezierTo(
      size.width,
      size.height / 2,
      size.width - (radius / 4),
      (size.height / 2) + (radius / 3),
    );
    path.lineTo(size.width * 0.75, size.height - (radius / 3));
    path.quadraticBezierTo(
      (size.width * 0.75) - radius / 4,
      size.height,
      (size.width * 0.75) - radius,
      size.height,
    );
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, radius / 2, size.height - radius);
    path.lineTo(
      (size.width * 0.25) - (radius / 4),
      (size.height / 2) + (radius / 3),
    );
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height / 2,
      (size.width * 0.25) - (radius / 4),
      (size.height / 2) - (radius / 3),
    );
    path.lineTo(radius / 2, radius);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
