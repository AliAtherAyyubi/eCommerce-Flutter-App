import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';

class Alert {
  static void success(BuildContext context, String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/components/success.png',
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  msg,
                  style: AppTypo.semibold14,
                )
              ],
            ),
          );
        });
  }
}
