import 'package:ecommerce_code/Screens/widgets/Cart/productSize.dart';
import 'package:ecommerce_code/Screens/widgets/Components/starRating.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProdcutDetailCard extends StatelessWidget {
  Map<String, dynamic> productData;

  ProdcutDetailCard({
    super.key,
    required this.productData,
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
          productData['title'] ?? "Title",
          style: AppTypo.semibold14.copyWith(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              '\$${productData['price'] ?? 0}',
              style: AppTypo.medium12.copyWith(fontSize: 18),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '${productData["discountPercentage"].round()}% off', // Discount text
              style: AppTypo.semibold14.copyWith(
                color: AppColor.primary2, // Red color for discount
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
              rating: productData["rating"],
            ),
            SizedBox(width: 8),
            Text(
              "${productData["rating"].toStringAsFixed(1)}",
              style: AppTypo.medium12,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          productData['description'], // Discount text
          style: AppTypo.regular12,
        ),
        SizedBox(
          height: 10,
        ),
        if (productData['category'].contains('shoes')) ...[
          SizeSelector(),
        ],
        SizedBox(
          height: 10,
        ),
        QuantitySelector(),
      ],
    );
  }
}

class QuantitySelector extends StatefulWidget {
  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Quantity: ',
          style: AppTypo.medium16,
        ),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: decrement,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            '$quantity',
            style: AppTypo.semibold14.copyWith(fontSize: 18),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: increment,
        ),
      ],
    );
  }
}
//



// String defaultDesc =
//     'Step into style and comfort with our Men\'s Classic Leather Sneakers. These shoes are designed for the modern man who values both fashion and functionality. Crafted from premium quality leather, they provide durability and a sleek, polished look that pairs perfectly with any outfit. Whether you\'re heading to the office, a casual day out, or a night on the town, these sneakers are versatile enough to complement your wardrobe.';

// //
// class ExpandableText extends StatefulWidget {
//   final String text;
//   final int maxLength;

//   ExpandableText({required this.text, this.maxLength = 185});

//   @override
//   _ExpandableTextState createState() => _ExpandableTextState();
// }

// class _ExpandableTextState extends State<ExpandableText> {
//   bool isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     String displayText =
//         isExpanded ? widget.text : widget.text.substring(0, widget.maxLength);

//     return RichText(
//       text: TextSpan(
//         style: AppTypo.regular.copyWith(fontSize: 12),
//         children: [
//           TextSpan(
//             text: displayText, // The main text
//           ),
//           if (widget.text.length >
//               widget.maxLength) // Only show 'More' if needed
//             TextSpan(
//               text: isExpanded ? ' Less' : ' More', // Show 'More' or 'Less'
//               style: AppTypo.regular.copyWith(
//                 fontSize: 12,
//                 color: AppColor.primary2,
//               ),
//               recognizer: TapGestureRecognizer()
//                 ..onTap = () {
//                   setState(() {
//                     isExpanded = !isExpanded;
//                   });
//                 },
//             ),
//         ],
//       ),
//       overflow: TextOverflow.visible, // Handle text overflow
//     );
//   }
// }