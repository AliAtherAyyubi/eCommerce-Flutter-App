import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';

class SpecialOfferBanner extends StatelessWidget {
  final String? descriptioin;

  SpecialOfferBanner({Key? key, this.descriptioin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          // Image on the left side
          ClipOval(
            child: Image.asset(
              'assets/components/offer.png',
              width: 60, // Adjust the width based on your requirement
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 30),
          // Title and description on the right side
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Special Offers ', style: AppTypo.medium16),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '\u{1F632}', // Surprise emoji
                      style: TextStyle(fontSize: 16, color: Colors.amber),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  descriptioin ??
                      'We make sure you get the offer you need at the best prices',
                  style: AppTypo.light12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
