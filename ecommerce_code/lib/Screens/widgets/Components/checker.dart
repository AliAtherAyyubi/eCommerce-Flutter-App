import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  bool isSelected;
  CheckBox({super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          border: isSelected ? null : Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(50)),
      child: Icon(
        Icons.check,
        size: 13,
        color: isSelected ? AppColor.black : Colors.transparent,
      ),
    );
  }
}
