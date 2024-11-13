import 'package:ecommerce_code/Screens/Products/prdouctDetail.dart';
import 'package:ecommerce_code/Screens/widgets/Components/starRating.dart';
import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redacted/redacted.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductCard extends StatefulWidget {
  double? borderRadius;

  bool isShadow;
  bool isimageRadius;
  bool isfavourite;
  Map<String, dynamic> productData = {};

  //
  ProductCard({
    required this.productData,
    this.borderRadius,
    this.isimageRadius = false,
    this.isShadow = true,
    this.isfavourite = false,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  //
  String _getShortenedTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length > 2) {
      return '${words.take(3).join(' ')}...';
    } else {
      return title;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool favourite = widget.isfavourite;
    Map<String, dynamic> product = widget.productData;
//
    return GestureDetector(
      onTap: () {
        // print(product['description']);
        Get.to(
            ProductDetailScreen(
              productData: product,
            ),
            transition: Transition.rightToLeft);
      },
      child: Container(
        width: 50.w,
        height: 40.h,
        // margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
            color: Colors.white,
            boxShadow: widget.isShadow
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
                borderRadius: BorderRadius.circular(
                    widget.isimageRadius ? widget.borderRadius ?? 8 : 0),
                child: Stack(
                  children: [
                    Image.network(
                        product['thumbnail'] ?? AppLayout.defaultProduct,
                        height: 270,
                        width: 100.w,
                        fit: BoxFit.cover, errorBuilder: (BuildContext context,
                            Object exception, StackTrace? stackTrace) {
                      return Image.asset(
                        'assets/images/error.jpg', // Your fallback asset image
                        height: 10.h,
                        width: 100.w,
                        fit: BoxFit.cover,
                      );
                    }),
                    Positioned(
                        bottom: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () {
                            if (favourite) {
                              setState(() {
                                widget.isfavourite = false;
                              });
                            } else {
                              setState(() {
                                widget.isfavourite = true;
                              });
                            }
                          },
                          child: Icon(
                            favourite ? Icons.favorite : Icons.favorite_border,
                            size: 25,
                            color: AppColor.primary,
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getShortenedTitle(product['title'] ?? "Product Title"),
                    style: AppTypo.medium16,
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(height: 10),
                  // Text(
                  //   product['description'],
                  //   maxLines: 2,
                  //   textHeightBehavior: TextHeightBehavior(
                  //       applyHeightToFirstAscent: false,
                  //       applyHeightToLastDescent: false),
                  //   overflow: TextOverflow.ellipsis,
                  //   style: AppTypo.regular.copyWith(
                  //     fontSize: 10,
                  //     height: 1,
                  //   ),
                  // ),
                  // const SizedBox(height: 5),

                  Row(
                    children: [
                      Text(
                        '\$${product['price']}',
                        style: AppTypo.medium14,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${product["discountPercentage"].round()}% off', // Discount text
                        style: AppTypo.regular.copyWith(
                          color: Color(0xffFE735C), // Red color for discount
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      StarRating(
                        rating:
                            double.parse(product["rating"].toStringAsFixed(1)),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "${product["rating"].toStringAsFixed(1)}",
                        style: AppTypo.regular12,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
