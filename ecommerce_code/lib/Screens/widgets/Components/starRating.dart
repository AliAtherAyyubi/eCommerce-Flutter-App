import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

//
class StarRating extends StatelessWidget {
  double rating;
  StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 0,
      maxRating: 5,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 0),
      itemSize: 22,
      unratedColor: Colors.amber[100],
      ignoreGestures: true,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: AppColor.yello,
      ),
      onRatingUpdate: (rating) {
        // print(rating);
      },
    );
  }
}
