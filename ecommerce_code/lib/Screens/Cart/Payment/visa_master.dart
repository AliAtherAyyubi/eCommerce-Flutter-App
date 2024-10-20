import 'package:ecommerce_code/Screens/widgets/Cart/creditCard.dart';
import 'package:ecommerce_code/Screens/widgets/Cart/creditcardfield.dart';
import 'package:ecommerce_code/Utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditCardForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  bool isVisa;

  CreditCardForm({super.key, required this.formKey, this.isVisa = true});

  @override
  State<CreditCardForm> createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardholderName = TextEditingController();
  TextEditingController CVV = TextEditingController();
  TextEditingController expiryDate = TextEditingController();

  //
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            CreditCard(
              cardNumber: cardNumber.text == '' ? null : cardNumber.text,
              holderName: cardholderName.text == ''
                  ? null
                  : cardholderName.text.capitalize,
              logo: widget.isVisa
                  ? 'assets/icons/visa.png'
                  : 'assets/icons/mastercard2.png',
              iconClr: widget.isVisa ? Colors.white : null,
            ),
            SizedBox(
              height: 15,
            ),
            CreditCardField(
              controller: cardNumber,
              validator: (value) => Validator.cardNumber(value!),
              onChange: (v) {
                setState(() {});
              },
              inputFormatter: Validator.maskCardNumber,
              hintText: 'Card Number',
              suffixImg: widget.isVisa
                  ? 'assets/icons/visa.png'
                  : 'assets/icons/mastercard.png',
              iconClr: widget.isVisa ? Colors.white : null,
              keyboardType: TextInputType.number,
              maxLength: 20,
            ),
            CreditCardField(
              hintText: 'Your Name',
              controller: cardholderName,
              onChange: (v) {
                setState(() {});
              },
              validator: (value) => Validator.name(value!),
              keyboardType: TextInputType.name,
              maxLength: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: CreditCardField(
                    controller: expiryDate,
                    inputFormatter: Validator.maskDate,
                    hintText: 'Exp Date',
                    validator: (value) => Validator.expiryDate(value!),
                    keyboardType: TextInputType.datetime,
                    maxLength: 10,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: CreditCardField(
                    hintText: 'CVV',
                    controller: CVV,
                    validator: (value) => Validator.CVV(value!),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
