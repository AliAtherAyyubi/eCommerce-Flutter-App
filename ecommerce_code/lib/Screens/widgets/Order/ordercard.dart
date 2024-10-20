import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String transactionId;
  final String confirmationStatus;
  final String price;
  final String date;
  bool isConfirmed;
  bool isPrepared;
  bool isShipped;
  VoidCallback? onTap;
  OrderCard({
    Key? key,
    required this.transactionId,
    required this.confirmationStatus,
    required this.price,
    required this.date,
    this.isConfirmed = true,
    this.isPrepared = false,
    this.isShipped = false,
    this.onTap,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isConfirmed) ...[
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: Color.fromARGB(61, 191, 158, 225),
                      child: Icon(
                        Icons.check,
                        color: Color(0xffA371F4),
                        size: 17,
                      ),
                    ),
                  ],
                  SizedBox(
                    width: 10,
                  ),
                  if (isPrepared) ...[
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: Color.fromARGB(60, 255, 198, 42),
                      child: Icon(
                        Icons.card_giftcard,
                        color: Color(0xffFCD240),
                        size: 17,
                      ),
                    ),
                  ],
                  SizedBox(
                    width: 10,
                  ),
                  if (isShipped) ...[
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: Color.fromARGB(62, 22, 189, 240),
                      child: Icon(
                        Icons.local_shipping_outlined,
                        color: Color(0xff007AFF),
                        size: 17,
                      ),
                    ),
                  ]
                ],
              )
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
              GestureDetector(
                onTap: onTap,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColor.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
