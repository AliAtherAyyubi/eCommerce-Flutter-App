import 'package:ecommerce_code/Screens/Order/orderDetail.dart';
import 'package:ecommerce_code/Screens/widgets/Components/tabbar.dart';
import 'package:ecommerce_code/Screens/widgets/Order/ordercard.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

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
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          SizedBox(
            height: 30,
          ),
          SecondaryTabbar(),
          // SizedBox(
          //   height: 20,
          // ),
          OrderCard(
            transactionId: '#GC092921',
            confirmationStatus: 'confirmed',
            price: '\$700',
            date: '22 Jun 2023 - 04:30 PM',
            isConfirmed: true,
            onTap: () {
              Get.to(() => OrderDetailsScreen(),
                  transition: Transition.rightToLeft);
            },
          ),
          OrderCard(
            transactionId: '#GC092921',
            confirmationStatus: 'preparing',
            price: '\$500',
            date: '22 Jun 2023 - 04:30 PM',
            isConfirmed: true,
            isPrepared: true,
          ),
          OrderCard(
            transactionId: '#GC092921',
            confirmationStatus: 'shipped',
            price: '\$900',
            date: '22 Jun 2023 - 04:30 PM',
            isConfirmed: true,
            isShipped: true,
            isPrepared: true,
          )
        ],
      ),
    );
  }
}
