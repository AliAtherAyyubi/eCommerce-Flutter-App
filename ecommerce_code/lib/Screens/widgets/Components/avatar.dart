import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  // double? radius;
  double? height;
  double? width;
  Avatar({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      // radius: radius ?? 30,
      child: Image.asset(
        'assets/images/profile.png',
        height: height ?? 50,
        width: width ?? 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
