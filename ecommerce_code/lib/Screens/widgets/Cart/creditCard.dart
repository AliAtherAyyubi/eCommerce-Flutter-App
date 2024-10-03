import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatefulWidget {
  final String? holderName;
  final String? cardNumber;
  final Function? onTopRightButtonClicked;
  final Gradient backgroundGradient;
  final String? logo;
  Color? iconClr;
  // final Widget? cardIcon;

  CreditCard({
    super.key,
    this.holderName,
    this.onTopRightButtonClicked,
    // this.cardIcon,
    this.cardNumber,
    this.logo,
    this.iconClr,
    this.backgroundGradient =
        const LinearGradient(colors: [Colors.black87, Colors.black54]),
  });

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height / 4,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        // color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        gradient: widget.backgroundGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/icons/creditcard.png',
                  height: 25,
                  width: 25,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                widget.onTopRightButtonClicked!();
              },
            )
          ]),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.cardNumber ?? "****  ****  ****  3799",
            style: AppTypo.semibold14
                .copyWith(fontSize: 16, color: Colors.white, letterSpacing: 1),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Holder',
                      style: AppTypo.medium12.copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.holderName!.toUpperCase() ?? 'Your Name',
                      style: AppTypo.semibold14
                          .copyWith(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Image.asset(
                widget.logo ?? "assets/icons/mastercard2.png",
                width: 50,
                height: 50,
                fit: BoxFit.contain,
                color: widget.iconClr,
              ),
            ],
          )
        ],
      ),
    );
  }
}
