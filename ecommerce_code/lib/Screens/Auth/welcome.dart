import 'dart:ui';
import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/components/getstart.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),

          // Blurred or Semi-transparent Content at the Bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(0.03),
                ], begin: Alignment.center, end: Alignment.topCenter),
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'You want\n Authentic,here\n you go!',
                    style: AppTypo.semibold14.copyWith(
                      color: Colors.white,
                      fontSize: 34,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Find it here, but it now!',
                    style: AppTypo.regular14.copyWith(
                      color: AppColor.lightGrey2,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  PrimaryButton(
                    onTap: () {},
                    text: 'Get Started',
                    width: 80.w,
                    fontSize: 23,
                  )
                  // Add more content here as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
