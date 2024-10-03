import 'package:ecommerce_code/Screens/widgets/Cart/productSize.dart';
import 'package:ecommerce_code/Screens/widgets/Components/starRating.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProdcutDetailCard extends StatelessWidget {
  String title;
  String? subTitle;
  String? description;
  double? rating;
  double? oldPrice;
  double price;
  double? discount;

  ProdcutDetailCard({
    super.key,
    required this.title,
    this.subTitle,
    this.description,
    this.rating,
    required this.price,
    this.oldPrice,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: AppTypo.semibold14.copyWith(fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        // Text(
        //   subTitle ?? "Subtitle",
        //   style: AppTypo.regular14,
        // ),
        // SizedBox(
        //   height: 10,
        // ),

        Row(
          children: [
            Text(
              '\$$oldPrice  ', // Old price with dollar symbol
              style: AppTypo.regular.copyWith(
                color: Colors.grey, // Grey color for old price
                fontWeight: FontWeight.w200,
                decoration: TextDecoration.lineThrough, // Strike through effect
                fontSize: 14,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '\$$price',
              style: AppTypo.medium12.copyWith(fontSize: 18),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '$discount% Off', // Discount text
              style: AppTypo.semibold14.copyWith(
                color: AppColor.primary2, // Red color for discount
              ),
            ),
          ],
        ),
        // SizedBox(
        //   height: 5,
        // ),
        // Text(
        //   'Product Details', // Discount text
        //   style: AppTypo.medium12.copyWith(fontSize: 14),
        // ),
        SizedBox(
          height: 5,
        ),
        ExpandableText(text: description ?? defaultDesc),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            StarRatingWidget(),
            SizedBox(width: 5),
            Text(
              '${rating ?? 0}',
              style: AppTypo.medium12
                  .copyWith(fontSize: 14, color: Color(0xff828282)),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),

        SizedBox(
          height: 10,
        ),
        SizeSelector(),
      ],
    );
  }
}

String defaultDesc =
    'Step into style and comfort with our Men\'s Classic Leather Sneakers. These shoes are designed for the modern man who values both fashion and functionality. Crafted from premium quality leather, they provide durability and a sleek, polished look that pairs perfectly with any outfit. Whether you\'re heading to the office, a casual day out, or a night on the town, these sneakers are versatile enough to complement your wardrobe.';

//
class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLength;

  ExpandableText({required this.text, this.maxLength = 200});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String displayText =
        isExpanded ? widget.text : widget.text.substring(0, widget.maxLength);

    return RichText(
      text: TextSpan(
        style: AppTypo.regular.copyWith(fontSize: 12),
        children: [
          TextSpan(
            text: displayText, // The main text
          ),
          if (widget.text.length >
              widget.maxLength) // Only show 'More' if needed
            TextSpan(
              text: isExpanded ? ' Less' : ' More', // Show 'More' or 'Less'
              style: AppTypo.regular.copyWith(
                fontSize: 12,
                color: AppColor.primary2,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
            ),
        ],
      ),
      overflow: TextOverflow.visible, // Handle text overflow
    );
  }
}
