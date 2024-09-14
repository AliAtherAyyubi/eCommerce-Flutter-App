import 'package:ecommerce_code/Screens/onboarding/onboardCard.dart';
import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                height: 75.h,
                width: 90.w,
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: onBoardinglist.length,
                    physics: const BouncingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return OnboardingCard(
                        onBoardingModel: onBoardinglist[index],
                      );
                    }),
              ),
            ),
            Center(
              child: AnimatedSmoothIndicator(
                count: onBoardinglist.length,
                activeIndex: _currentIndex,
                effect: ExpandingDotsEffect(
                    dotColor: AppColor.grey, activeDotColor: AppColor.black),
              ),
            ),
            const SizedBox(height: 37),
            PrimaryButton(
              elevation: 0,
              onTap: () {
                if (_currentIndex == onBoardinglist.length - 1) {
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                  setState(() {
                    _currentIndex++;
                  });
                }
              },
              text: _currentIndex == onBoardinglist.length - 1
                  ? 'Get Started'
                  : 'Next',
              // borderRadius: 20,
              // height: 46,
              // width: 327,
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoarding {
  String title;
  String description;
  String image;

  OnBoarding({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnBoarding> onBoardinglist = [
  OnBoarding(
    title: 'Choose Products',
    image: 'assets/onboard/1.png',
    description:
        'The essential language learning tools and resources you need to seamlessly transition into mastering a new language',
  ),
  OnBoarding(
      title: 'Make Payment',
      image: 'assets/onboard/2.png',
      description:
          'Engaging features including test, story telling, and conversations that motivate and inspire language learners to unlock their full potential'),
  OnBoarding(
      title: "Get Your Order",
      image: 'assets/onboard/3.png',
      description:
          'Updated TalkGpt with premium materials and a dedicated following, providing language learners with immersive content for effective learning'),
];
