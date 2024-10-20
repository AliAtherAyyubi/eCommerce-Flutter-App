import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Color? color;
  Loader({this.color});
  //
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? AppColor.primary,
      ),
    );
  }
}
