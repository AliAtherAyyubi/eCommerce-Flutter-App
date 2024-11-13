import 'package:ecommerce_code/Screens/Cart/address.dart';
import 'package:ecommerce_code/Screens/widgets/Cart/shopCard.dart';
import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenClr,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Cart',
          isleading: false,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Delivery Address",
                style: AppTypo.semibold14.copyWith(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          UserAddress(),
          //
          SizedBox(
            height: 30,
          ),
          //
          Text(
            'Shopping List', // Pass the title here
            style: AppTypo.semibold14.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          const ShoppingCard(
              title: 'Women\'s Casual Wear ',
              image: 'assets/store/shirt.png',
              price: 45,
              oldPrice: 64,
              discount: 33,
              rating: 4.8,
              choices: ['Green', 'Grey']),

          SizedBox(
            height: 15,
          ),
          PrimaryButton(onTap: () {}, text: 'Checkout')
        ],
      ),
    );
  }
}
