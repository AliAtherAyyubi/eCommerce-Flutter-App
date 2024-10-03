import 'package:ecommerce_code/Screens/widgets/Cart/creditcardfield.dart';
import 'package:flutter/material.dart';

class PayPalPaymentScreen extends StatelessWidget {
  TextEditingController paypalEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CreditCardField(
          controller: paypalEmail,
          hintText: 'Enter your paypal email',
          suffixImg: 'assets/icons/paypal.png',
        ),
      ],
    );
  }
}
