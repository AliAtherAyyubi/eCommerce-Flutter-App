import 'package:ecommerce_code/Screens/Cart/Payment/paymentMethod.dart';
import 'package:ecommerce_code/Screens/widgets/Cart/creditCard.dart';
import 'package:ecommerce_code/Screens/widgets/Cart/creditcardfield.dart';
import 'package:ecommerce_code/Screens/widgets/Components/alert.dart';
import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/labels.dart';
import 'package:ecommerce_code/Screens/widgets/appBar.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:ecommerce_code/Utils/validation.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  // const PaymentScreen({super.key});
  final GlobalKey<FormState> paymentFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenClr,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Checkout',
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        children: [
          SizedBox(
            height: 30,
          ),

          Text(
            'Payment Method',
            style: AppTypo.medium16,
          ),
          SizedBox(
            height: 15,
          ),
          PaymentMethod(
            formKey: paymentFormKey,
          ),
          //

          //
          //
          SizedBox(
            height: 20,
          ),
          RowText(
            title: 'Order',
            titleStyle: t1,
            rightText: '\$ 50',
            rightStyle: t2,
          ),

          RowText(
            title: 'Shipping',
            titleStyle: t1,
            rightText: '\$ 20',
            rightStyle: t2,
          ),
          RowText(
            title: 'Discount',
            titleStyle: t1,
            rightText: '\$ -20',
            rightStyle: t2,
          ),

          Divider(),

          RowText(
            title: 'Total',
            titleStyle: AppTypo.medium16.copyWith(fontSize: 18),
            rightText: '\$ 64',
            rightStyle: AppTypo.semibold14,
          ),
          SizedBox(
            height: 20,
          ),
          PrimaryButton(
            onTap: () {
              if (paymentFormKey.currentState!.validate()) {
                print('ok');
              }
              Alert.success(context, 'Payment done successfully!');
            },
            text: 'Place Order',
            height: 60,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

TextStyle t1 = AppTypo.medium16.copyWith(fontSize: 14, color: AppColor.grey);
TextStyle t2 = AppTypo.semibold14.copyWith(
  fontSize: 14,
);