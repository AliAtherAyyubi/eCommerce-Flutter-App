import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String transactionId;
  final String confirmationStatus;
  final String price;
  final String date;

  const OrderCard({
    Key? key,
    required this.transactionId,
    required this.confirmationStatus,
    required this.price,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.lightGrey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Status and Checkmark
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Status Badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColor.lightGrey3,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  confirmationStatus,
                  style: AppTypo.bold.copyWith(
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              // Checkmark Icon
              CircleAvatar(
                radius: 13,
                backgroundColor: Colors.purple[50],
                child: Icon(
                  Icons.check,
                  color: Colors.purple,
                  size: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          // Transaction ID
          Text(
            transactionId,
            style: AppTypo.regular.copyWith(
              color: AppColor.grey,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
          // Price
          Text(
            price,
            style: AppTypo.bold.copyWith(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          // Date and Arrow Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: AppTypo.regular.copyWith(
                  color: AppColor.grey,
                  fontSize: 12,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
