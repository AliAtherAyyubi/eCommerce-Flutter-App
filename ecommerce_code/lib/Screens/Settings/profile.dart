import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/textfield.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  GlobalKey key = GlobalKey();

  //
  TextEditingController userName = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenClr,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Account Details',
        ),
      ),
      body: ListView(
        padding: AppLayout.screenSpace,
        children: [
          SizedBox(
            height: 20,
          ),
          Form(
              key: key,
              child: Column(
                children: [
                  AuthField(hintText: 'Username', controller: userName),
                  AuthField(hintText: 'Mobile Number', controller: mobile),
                  AuthField(hintText: 'Email', controller: email),
                  AuthField(hintText: 'Password', controller: password),
                  SizedBox(
                    height: 10,
                  ),
                  PrimaryButton(onTap: () {}, text: 'Edit')
                ],
              ))
        ],
      ),
    );
  }
}
