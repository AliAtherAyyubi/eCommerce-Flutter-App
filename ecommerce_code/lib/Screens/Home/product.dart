import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeProductCard extends StatelessWidget {
  const HomeProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 100.w,
      color: Colors.white,
      child: Row(
        children: [
          Image.asset(
            'assets/components/card/Rectangle.png',
            height: 100.h,
            width: 25,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: Container(
              height: 200,
              width: 100.w,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              color: Color(0xffE7E7EB).withOpacity(0.3),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/components/card/dots.png',
                    height: 100.h,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/store/sandle.png',
                        height: 100,
                        width: 120,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Flat and Heels',
                            style: AppTypo.medium16,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Stand a chance to get rewarded',
                            style: AppTypo.regular,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: PrimaryButton(
                              onTap: () {},
                              text: 'Visit now',
                              suffixIcon: Icons.arrow_forward,
                              height: 30,
                              width: 30.w,
                              borderRadius: 4,
                              textStyle: AppTypo.medium12
                                  .copyWith(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
