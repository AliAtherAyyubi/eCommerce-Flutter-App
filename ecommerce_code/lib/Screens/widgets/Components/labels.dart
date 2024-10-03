import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  String title;
  String rightText;
  TextStyle? titleStyle;
  TextStyle? rightStyle;
  VoidCallback? onPress;
  //
  RowText(
      {super.key,
      required this.title,
      required this.rightText,
      this.titleStyle,
      this.onPress,
      this.rightStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title, // Pass the title here
              style: titleStyle ?? AppTypo.regular.copyWith(fontSize: 17),
            ),
          ),
          GestureDetector(
            onTap: onPress,
            child: Text(
              rightText, // Pass the title here
              style: rightStyle ?? AppTypo.semibold14.copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
