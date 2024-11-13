import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';

class FashionItemsWidget extends StatelessWidget {
  // Sample data
  String? image;
  String? title;
  final VoidCallback onTap;

  FashionItemsWidget({this.image, this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            // Circular image
            ClipOval(
              child: Image.asset(
                image ?? "assets/images/profile.png",
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            // Text below the image
            Text(
              title ?? 'Fashion',
              style: AppTypo.regular14.copyWith(
                fontSize: 12,
                color: Color(0xFF21003D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
