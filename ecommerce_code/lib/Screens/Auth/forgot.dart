import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/textfield.dart';
import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: CustomAppBar(),
      ),
      body: ListView(
        padding: AppLayout.screenSpace,
        children: [
          Text('Forgot \npassword?', style: AppTypo.h1),
          SizedBox(
            height: 30,
          ),
          Form(
            key: _formKey,
            child: AuthField(
              controller: _emailController,
              hintText: 'Enter your email address',
              prefixIcon: Icons.email,
              validator: (value) {
                if (value!.isEmpty) return 'Enter your email address';
                return null;
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '* We will send you a message to set or reset your new password',
            style: AppTypo.regular14
                .copyWith(fontSize: 12, color: AppColor.darkGrey),
          ),
          SizedBox(
            height: 30,
          ),
          PrimaryButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {}
            },
            text: 'Submit',
            width: 100.w,
          ),
        ],
      ),
    );
  }
}
