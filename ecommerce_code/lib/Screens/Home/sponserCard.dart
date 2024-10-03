import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SponsoredCard extends StatelessWidget {
  const SponsoredCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 100.w,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title 'Sponsored'
          Text(
            'Sponsored',
            style: AppTypo.medium16.copyWith(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Circular Image
            child: Image.asset(
              'assets/store/offer.png', // Replace with your image asset
              height: 32.h,
              width: 100.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Image with Border Radius
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 'Up to 50% Off' Text behind Image
              Expanded(
                child: Text(
                  'Up to 50% Off',
                  style: AppTypo.bold.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              // Circular Image
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Color(0xff323232),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SummerSaleCard extends StatelessWidget {
  const SummerSaleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Image.asset(
            'assets/store/summer.png',
            height: 30.h,
            width: 100.w,
            fit: BoxFit.contain,
          ),
          Row(
            children: [
              SizedBox(
                height: 7,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Arrivals',
                      style: AppTypo.medium16.copyWith(fontSize: 20),
                    ),
                    Text(
                      'Summer’ 25 Collections',
                      style: AppTypo.regular.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                onTap: () {},
                text: 'View all',
                suffixIcon: Icons.arrow_forward,
                height: 35,
                width: 30.w,
                borderRadius: 4,
                fontSize: 12,
              )
            ],
          )
        ],
      ),
    );
  }
}
