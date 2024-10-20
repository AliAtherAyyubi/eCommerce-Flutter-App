import 'package:ecommerce_code/Screens/widgets/Components/starRating.dart';
import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductCard extends StatefulWidget {
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
  bool isfavourite;
  VoidCallback? onTap;
  //
  ProductCard(
      {required this.title,
      this.imageUrl,
      required this.price,
      this.oldPrice,
      this.onTap,
      this.borderRadius,
      this.isimageRadius = false,
      this.isShadow = true,
      this.discount,
      this.isfavourite = false,
      this.description,
      this.rating});

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

    return GestureDetector(
      onTap: widget.onTap,
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
                    Image.network(widget.imageUrl ?? AppLayout.defaultProduct,
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
                        top: 2,
                        right: 2,
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
                            color: favourite ? AppColor.white : Colors.white,
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
                    _getShortenedTitle(widget.title ?? "Product Title"),
                    style: AppTypo.medium16,
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.description!,
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
                    '\$${widget.price}',
                    style: AppTypo.medium14,
                  ),
                  if (widget.oldPrice != null) ...[
                    Row(
                      children: [
                        Text(
                          '\$${(widget.price! + 20)}  ', // Old price with dollar symbol
                          style: AppTypo.regular.copyWith(
                            color: Colors.grey, // Grey color for old price
                            fontWeight: FontWeight.w200,
                            decoration: TextDecoration
                                .lineThrough, // Strike through effect
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '${widget.discount}% off', // Discount text
                          style: AppTypo.regular.copyWith(
                            color: Color(0xffFE735C), // Red color for discount
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                  // Row(
                  //   children: [
                  //     StarRatingWidget(),
                  //     SizedBox(width: 5),
                  //     Text(
                  //       '( ${widget.rating} )',
                  //       style: AppTypo.regular.copyWith(
                  //           fontSize: 10,
                  //           color: Color.fromARGB(255, 78, 119, 202)),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
