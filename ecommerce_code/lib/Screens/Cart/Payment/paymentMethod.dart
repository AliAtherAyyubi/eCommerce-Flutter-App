import 'package:ecommerce_code/Screens/Cart/Payment/paypal.dart';
import 'package:ecommerce_code/Screens/Cart/Payment/visa_master.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentMethodChoiceW extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  PaymentMethodChoiceW({super.key, required this.formKey});
  @override
  State<PaymentMethodChoiceW> createState() => _PaymentMethodChoiceWState();
}

class _PaymentMethodChoiceWState extends State<PaymentMethodChoiceW> {
//
  bool selectPayment = false;
  int paymentIndex = 0;
  //
  final PageController pageController = PageController(initialPage: 0);
  // int paymentIndex = 0;
//
  double formHeight = 55.h;

  void formSize(int index) {
    double tempIndex;
    if (index == 0) {
      tempIndex = 80.h;
    } else if (index == 1) {
      tempIndex = 12.h;
    } else if (index == 2) {
      tempIndex = 55.h;
    } else if (index == 3) {
      tempIndex = 5.h;
    } else {
      tempIndex = 55.h;
    }
    setState(() {
      formHeight = tempIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> paymentCards = [
      CreditCardForm(
        formKey: widget.formKey,
        isVisa: true,
      ),
      PayPalPaymentScreen(),
      CreditCardForm(
        formKey: widget.formKey,
        isVisa: false,
      ),
      Container(
        child: Text(
          'Cash on Delievery',
          style: AppTypo.h2.copyWith(color: AppColor.secondary),
        ),
      )
    ];
    return Column(
      children: [
        SizedBox(
          height: 90,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: paymentIcon.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    formSize(index);
                    setState(() {
                      paymentIndex = index;
                    });
                  },
                  child: PaymentMethodChoiceWOption(
                    iconImg: paymentIcon[index],
                    selectMethod: paymentIndex == index,
                  ),
                );
              }),
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: formHeight,
          child: PageView.builder(
              itemCount: paymentCards.length,
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              itemBuilder: (context, index) {
                return paymentCards[paymentIndex];
              }),
        )
        //
      ],
    );
  }
}

class PaymentMethodChoiceWOption extends StatelessWidget {
  String iconImg;
  bool selectMethod;
  PaymentMethodChoiceWOption(
      {super.key, required this.iconImg, this.selectMethod = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 90,
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          border: selectMethod
              ? Border.all(
                  color: AppColor.primary,
                )
              : null,
          color: Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xffFAFAFB),
            radius: 30,
            child: Image.asset(
              iconImg,
              height: 55,
              width: 55,
            ),
          ),
          Container(
            height: 20,
            width: 20,
            margin: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border:
                    selectMethod ? null : Border.all(color: Color(0xffE2E0EC)),
                color: selectMethod ? AppColor.primary : AppColor.lightGrey2),
            child: Center(
                child: selectMethod
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      )
                    : Container()),
          ),
        ],
      ),
    );
  }
}

List<String> paymentIcon = [
  'assets/icons/visa.png',
  'assets/icons/paypal.png',
  'assets/icons/mastercard.png',
  'assets/icons/cod.png'
];
//

