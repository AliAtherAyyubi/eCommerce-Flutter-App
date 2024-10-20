import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/textfield.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:flutter/material.dart';

class PasswrodScreen extends StatelessWidget {
  PasswrodScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController currentPin = TextEditingController();
  TextEditingController newPin = TextEditingController();
  TextEditingController confirmNewPin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenClr,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Password',
        ),
      ),
      body: Padding(
        padding: AppLayout.screenSpace,
        child: Column(
          children: [
            Expanded(
              child: Form(
                  child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  AuthField(
                    controller: currentPin,
                    hintText: 'Current Password',
                    borderRadius: 10,
                  ),
                  AuthField(controller: newPin, hintText: 'New Password'),
                  AuthField(
                      controller: confirmNewPin,
                      hintText: 'Confirm New Password'),
                ],
              )),
            ),
            // Spacer(),
            PrimaryButton(onTap: () {}, text: 'Save'),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
