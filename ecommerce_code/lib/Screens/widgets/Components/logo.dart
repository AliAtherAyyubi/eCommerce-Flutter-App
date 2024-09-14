import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyLogo extends StatelessWidget {
  double? height;
  double? width;
  MyLogo({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height ?? 14.h,
        width: width ?? 80.w,
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
