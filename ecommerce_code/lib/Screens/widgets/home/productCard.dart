import 'package:ecommerce_code/Screens/widgets/Components/starRating.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductCard extends StatelessWidget {
  String? imageUrl;
  String? title;
  String? description;
  double? price;
  double? oldPrice;
  double? discount;
  double? rating;
  double? borderRadius;

  bool isShadow;
  bool isimageRadius;
  //
  ProductCard(
      {required this.title,
      this.imageUrl,
      required this.price,
      this.oldPrice,
      this.borderRadius,
      this.isimageRadius = false,
      this.isShadow = true,
      this.discount,
      this.description,
      this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      // height: 40.h,
      // margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          color: Colors.white,
          boxShadow: isShadow
              ? const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 2,
                  )
                ]
              : []),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(isimageRadius ? borderRadius ?? 8 : 0),
              child: Image.asset(
                'assets/store/shirt.png',
                height: 180,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: AppTypo.medium16,
                  overflow: TextOverflow.fade,
                ),
                const SizedBox(height: 5),
                Text(
                  description!,
                  maxLines: 2,
                  textHeightBehavior: TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: false),
                  overflow: TextOverflow.ellipsis,
                  style: AppTypo.regular.copyWith(
                    fontSize: 10,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '\$$price',
                  style: AppTypo.medium12,
                ),
                if (oldPrice != null) ...[
                  Row(
                    children: [
                      Text(
                        '\$$oldPrice  ', // Old price with dollar symbol
                        style: AppTypo.regular.copyWith(
                          color: Colors.grey, // Grey color for old price
                          fontWeight: FontWeight.w200,
                          decoration: TextDecoration
                              .lineThrough, // Strike through effect
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '$discount% off', // Discount text
                        style: AppTypo.regular.copyWith(
                          color: Color(0xffFE735C), // Red color for discount
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
                Row(
                  children: [
                    StarRatingWidget(),
                    SizedBox(width: 5),
                    Text(
                      '( $rating )',
                      style: AppTypo.regular.copyWith(
                          fontSize: 10,
                          color: Color.fromARGB(255, 78, 119, 202)),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
