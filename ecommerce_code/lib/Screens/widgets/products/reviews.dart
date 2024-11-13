import 'package:ecommerce_code/Screens/widgets/Components/avatar.dart';
import 'package:ecommerce_code/Screens/widgets/Components/starRating.dart';
import 'package:ecommerce_code/Utils/date.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';

class CustomerReviews extends StatelessWidget {
  List<dynamic> reviews;
  CustomerReviews({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> review = reviews[index];
          //
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)]),
            child: Row(
              children: [
                Avatar(),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StarRating(rating: review['rating'].toDouble()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        review["reviewerName"],
                        style: AppTypo.semibold14,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        review["comment"],
                        style: AppTypo.regular12,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        TimeFormat.randomDate(),
                        style: AppTypo.medium12,
                      )
                    ],
                  ),
                ))
              ],
            ),
          );
        });
  }
}
