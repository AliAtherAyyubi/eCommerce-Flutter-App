import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ItemReviewCard extends StatefulWidget {
  String title;
  String? category;
  double? size;
  String? delieveryDate;
  String? imageUrl;
  //
  ItemReviewCard(
      {super.key,
      required this.title,
      this.category,
      this.delieveryDate,
      this.imageUrl,
      this.size});

  @override
  State<ItemReviewCard> createState() => _ItemReviewCardState();
}

class _ItemReviewCardState extends State<ItemReviewCard> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            widget.imageUrl ?? 'assets/store/shirt.png',
            height: 200,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        //
        SizedBox(
          width: 10,
        ),
        //
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title, // Pass the title here
              style: AppTypo.semibold14.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              widget.category ??
                  'Checked Single-Breasted Blazer', // Pass the title here
              style: AppTypo.regular.copyWith(fontSize: 13),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Size: ${widget.size}', // Pass the title here
              style: AppTypo.regular14,
            ),
            SizedBox(
              height: 5,
            ),
            //
            Row(
              children: [
                // Minus Button
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) quantity--;
                    });
                  },
                  icon: Icon(Icons.remove_circle),
                ),
                // Quantity Number
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    quantity.toString(),
                    style: AppTypo.medium16.copyWith(fontSize: 18),
                  ),
                ),
                // Plus Button
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (quantity < 10) quantity++;
                    });
                  },
                  icon: Icon(Icons.add_circle),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //
            Row(
              children: [
                Text(
                  'Delivery by ', // Pass the title here
                  style: AppTypo.regular14.copyWith(fontSize: 13),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    widget.delieveryDate ??
                        '10 March 2024', // Pass the title here
                    style: AppTypo.semibold14.copyWith(fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        ))
      ],
    );
  }
}
