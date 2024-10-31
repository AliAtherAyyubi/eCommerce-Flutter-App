import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_code/Screens/Settings/newCard.dart';
import 'package:ecommerce_code/Screens/widgets/Cart/creditCard.dart';
import 'package:ecommerce_code/Screens/widgets/Components/checker.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentMethodSetting extends StatelessWidget {
  const PaymentMethodSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenClr,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Payment Method',
        ),
      ),
      body: ListView(
        padding: AppLayout.screenSpace,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'My Cards',
            style: AppTypo.medium16,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 200,
            width: 100.w,
            child: Swiper(
              loop: false,
              itemBuilder: (BuildContext context, int index) {
                return CreditCard(
                  holderName: 'Your Name',
                  cardNumber: '7898 4565 7845 8952',
                );
              },
              itemCount: 3,
              itemHeight: 40.h,
              itemWidth: 90.w,
              layout: SwiperLayout.STACK,

              // customLayoutOption: Customla,
              pagination: null,
              control: null,
            ),
          ),
          CreditCardSelection()
        ],
      ),
    );
  }
}

class CreditCardSelection extends StatefulWidget {
  @override
  _CreditCardSelectionState createState() => _CreditCardSelectionState();
}

class _CreditCardSelectionState extends State<CreditCardSelection> {
  String selectedCard = "7488"; // The last 4 digits of the card selected

  List<Map<String, String>> cards = [
    {'cardNumber': '7488', 'expiry': '01/25'},
    {'cardNumber': '1234', 'expiry': '01/25'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: 90.w,
      height: 220,
      decoration: BoxDecoration(
          color: AppColor.black, borderRadius: BorderRadius.circular(20)),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount:
            cards.length + 1, // Two cards and one option to add a new card
        itemBuilder: (context, index) {
          if (index < cards.length) {
            return CreditCardTile(
              cardNumber: cards[index]['cardNumber']!,
              expiry: cards[index]['expiry']!,
              isSelected: selectedCard == cards[index]['cardNumber'],
              onSelect: () {
                setState(() {
                  selectedCard = cards[index]['cardNumber']!;
                });
              },
            );
          } else {
            return AddNewCardTile();
          }
        },
      ),
    );
  }
}

class CreditCardTile extends StatelessWidget {
  final String cardNumber;
  final String expiry;
  final bool isSelected;
  final VoidCallback onSelect;

  CreditCardTile({
    required this.cardNumber,
    required this.expiry,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/icons/mastercard.png', // Assuming the card image path
        height: 40,
        width: 40,
      ),
      title: Text(
        'MasterCard - $cardNumber',
        style: AppTypo.regular14.copyWith(color: Colors.white),
      ),
      subtitle: Text(
        expiry,
        style: AppTypo.regular12.copyWith(color: AppColor.grey500),
      ),
      trailing: CheckBox(isSelected: isSelected),
      onTap: onSelect,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      // tileColor: Colors.black,
    );
  }
}

class AddNewCardTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/icons/creditcard.png',
        height: 40,
        width: 40,
        fit: BoxFit.contain,
      ),
      title: Text(
        'Add credit card',
        style: AppTypo.regular14.copyWith(color: Colors.white),
      ),
      subtitle: Text(
        'Add new credit or debit card',
        style: AppTypo.regular12.copyWith(color: AppColor.grey500),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.white,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      onTap: () {
        Get.to(() => AddNewCardScreen(), transition: Transition.rightToLeft);
        // Action to add a new card
      },
    );
  }
}
