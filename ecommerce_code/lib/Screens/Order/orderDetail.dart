import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Order/stepper.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenClr,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Orders',
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          // Step Progress Bar
          SizedBox(
            height: 20,
          ),
          OrderStepper(currentStepNo: 1),
          // Order Details Container
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.lightGrey)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('#Order ID  GC092921', style: AppTypo.semibold14),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery Date', style: AppTypo.semibold14),
                    Text('20 March, 5:30 PM', style: AppTypo.semibold14),
                  ],
                ),
                SizedBox(height: 15),
                Text('Delivery Location', style: AppTypo.semibold14),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColor.lightGrey2,
                      radius: 30,
                      child: Icon(Icons.location_on, color: AppColor.black),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Moon Road, West Subidbazar',
                            style: AppTypo.medium14),
                        Text('Sylhet - 3100',
                            style: AppTypo.regular12.copyWith(
                              color: AppColor.grey,
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text('Payment Method', style: AppTypo.semibold14),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColor.lightGrey2,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          'assets/icons/paypal.png',
                          height: 20,
                          fit: BoxFit.contain,
                        )),
                    SizedBox(width: 10),
                    Text('Paypal Card', style: AppTypo.semibold14),
                    Spacer(),
                    Text('**** 0696 4629', style: AppTypo.regular12),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Product Information
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/store/shoes.png',
                    height: 80,
                    fit: BoxFit.contain,
                  )),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jeka Jacket',
                      style: AppTypo.regular.copyWith(fontSize: 16)),
                  Text('Size: S, Color: Green', style: AppTypo.regular12),
                ],
              ),
              Spacer(),
              Text('\$12', style: AppTypo.bold.copyWith(fontSize: 16)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal',
                  style: AppTypo.medium16.copyWith(color: AppColor.grey)),
              Text('\$1250.00', style: AppTypo.medium16.copyWith(fontSize: 18)),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shopping',
                  style: AppTypo.medium16.copyWith(color: AppColor.grey)),
              Text('\$40.90', style: AppTypo.medium16.copyWith(fontSize: 18)),
            ],
          ),
          SizedBox(height: 5),
          Divider(thickness: 1, color: AppColor.grey),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Cost', style: AppTypo.medium16),
              Text('\$1690.99', style: AppTypo.medium12.copyWith(fontSize: 20)),
            ],
          ),
          SizedBox(height: 20),
          // Track Order Button
          PrimaryButton(onTap: () {}, text: 'Track Order')
        ],
      ),
    );
  }
}
