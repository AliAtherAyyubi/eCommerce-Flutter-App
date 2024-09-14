import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SalesAdCard extends StatefulWidget {
  const SalesAdCard({super.key});

  @override
  State<SalesAdCard> createState() => _SalesAdCardState();
}

class _SalesAdCardState extends State<SalesAdCard> {
  final PageController _pageController = PageController();
  int _currentPage = 1;

  // Sample data (replace with actual data)
  final List<Map<String, String>> items = [
    {
      'image': 'assets/components/product.png',
      'title': 'Item 1',
    },
    {
      'image': 'assets/components/product.png',
      'title': 'Item 2',
    },
    {
      'image': 'assets/components/product.png',
      'title': 'Item 3',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 230, // Adjust height as needed
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(items[index]['image']!),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '50-40% OFF',
                          style: AppTypo.bold.copyWith(
                            fontSize: 20,
                            color: AppColor.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Now in (product) \n All colours',
                          style: AppTypo.regular14.copyWith(
                            fontSize: 12,
                            color: AppColor.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        PrimaryButton(
                          onTap: () {},
                          text: 'Shop Now',
                          isBorder: true,
                          fontSize: 14,
                          width: 31.w,
                          height: 45,
                          borderRadius: 10,
                          suffixIcon: FontAwesomeIcons.arrowRight,
                          bgColor: Colors.transparent,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // const SizedBox(height: 20), // Space between ListView and indicator
        SmoothPageIndicator(
          controller: _pageController,
          count: items.length,
          effect: ScaleEffect(
            dotHeight: 10,
            dotWidth: 10,
            dotColor: Color(0xffDEDBDB),
            activeDotColor: Color(0xFFFFA3B3),
          ),
        ),
      ],
    );
  }
}
