import 'package:ecommerce_code/Screens/Auth/login.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  static void msgBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Logout',
                  style: AppTypo.semibold14,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Are you sure you want to logout?',
                  style: AppTypo.regular12,
                )
              ],
            ),
            actionsPadding: EdgeInsets.all(5),
            actionsAlignment: MainAxisAlignment.center,
            actionsOverflowButtonSpacing: 10,
            actions: [
              TextButton(
                onPressed: () {
                  // Log out functionality
                },
                child: Text(
                  'Cancel',
                  style: AppTypo.semibold14.copyWith(
                      color: AppColor.primary), // AppTypo for log out button
                ),
              ),
              TextButton(
                onPressed: () {
                  // Log out functionality
                  Get.to(LoginScreen(), transition: Transition.fadeIn);
                },
                child: Text(
                  'Log Out',
                  style: AppTypo.semibold14.copyWith(
                      color: AppColor.lightBlue), // AppTypo for log out button
                ),
              ),
            ],
          );
        });
  }
}
