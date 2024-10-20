import 'package:ecommerce_code/Screens/widgets/Cart/itemReview.dart';
import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/labels.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenClr,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Shopping Bag',
          trailingIcon: Icons.favorite_outline,
        ),
      ),

      //
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                ItemReviewCard(
                  title: 'Women’s Casual Wear',
                  size: 42,
                  delieveryDate: '10 Aug 2024',
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/coupon.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Apply Coupons', // Pass the title here
                          style: AppTypo.medium16,
                        ),
                      ],
                    )),
                    Text(
                      'Select', // Pass the title here
                      style:
                          AppTypo.semibold14.copyWith(color: AppColor.primary),
                    ),
                  ],
                ),
                //
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Order Payment Details', // Pass the title here
                  style: AppTypo.medium16.copyWith(fontSize: 17),
                ),
                SizedBox(
                  height: 20,
                ),
                RowText(title: 'Order Amount', rightText: '\$64'),
                SizedBox(
                  height: 10,
                ),
                RowText(
                  title: 'Convenience',
                  rightText: 'Apply Coupon',
                  rightStyle: AppTypo.semibold14
                      .copyWith(fontSize: 12, color: AppColor.primary),
                  onPress: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                RowText(
                  title: 'Delivery Free',
                  rightText: 'Free',
                  rightStyle:
                      AppTypo.semibold14.copyWith(color: AppColor.primary),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                //
                SizedBox(
                  height: 20,
                ),

                ///
                RowText(
                  title: 'Order Total',
                  rightText: '\$65',
                  titleStyle: AppTypo.medium16.copyWith(fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                RowText(
                  title: 'EMI Available',
                  rightText: 'Details',
                  titleStyle: AppTypo.regular.copyWith(fontSize: 16),
                  rightStyle:
                      AppTypo.semibold14.copyWith(color: AppColor.primary),
                  onPress: () {},
                ),
              ],
            ),
          ),
          Container(
            // height: 150,
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xff979797)),
                borderRadius: BorderRadius.circular(30),
                color: Color(0xffF8F8F8)),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    '\$64',
                    style: AppTypo.semibold14.copyWith(fontSize: 18),
                  ),
                ),
                Expanded(
                    flex: 10,
                    child: PrimaryButton(
                      onTap: () {},
                      text: 'Proceed to Payment',
                      textStyle: AppTypo.medium16
                          .copyWith(fontSize: 17, color: Colors.white),
                      borderRadius: 8,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
