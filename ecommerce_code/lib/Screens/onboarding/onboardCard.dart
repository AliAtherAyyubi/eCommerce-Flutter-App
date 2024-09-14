import 'package:ecommerce_code/Screens/onboarding/onboarding.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingCard extends StatelessWidget {
  final OnBoarding onBoardingModel;
  const OnboardingCard({required this.onBoardingModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: 400,
            width: 90.w,
            child: Image.asset(
              onBoardingModel.image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text(
          onBoardingModel.title,
          textAlign: TextAlign.center,
          style: AppTypo.h2,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          onBoardingModel.description,
          textAlign: TextAlign.center,
          style: AppTypo.semibold14.copyWith(color: AppColor.grey, height: 1.5),
        ),
      ],
    );
  }
}
