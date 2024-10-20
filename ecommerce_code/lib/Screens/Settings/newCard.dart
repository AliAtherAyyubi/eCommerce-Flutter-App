import 'package:ecommerce_code/Screens/Cart/Payment/visa_master.dart';
import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';

class AddNewCardScreen extends StatelessWidget {
  AddNewCardScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenClr,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Add New Card',
        ),
      ),
      body: ListView(
        padding: AppLayout.screenSpace,
        children: [
          Text(
            'Add New Card',
            style: AppTypo.medium16.copyWith(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          CreditCardForm(formKey: formKey),
          SizedBox(
            height: 10,
          ),
          PrimaryButton(onTap: () {}, text: 'Save Card')
        ],
      ),
    );
  }
}
