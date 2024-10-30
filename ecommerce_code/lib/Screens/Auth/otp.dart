import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenClr,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(title: 'OTP Verificatioin')),
      body: SafeArea(
        child: ListView(
          padding: AppLayout.screenSpace,
          children: [
            const SizedBox(height: 16),
            Text(
              "OTP Verification",
              style: AppTypo.bold.copyWith(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "We sent your code to +1 898 860 *** \nThis code will expired in 00:30",
              textAlign: TextAlign.center,
              style: AppTypo.medium14.copyWith(color: AppColor.grey),
            ),
            // const SizedBox(height: 16),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            const OtpForm(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Resend OTP Code",
                style: TextStyle(color: Color(0xFF757575)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(12)),
);

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PinField(),
              PinField(),
              PinField(),
              PinField(),
            ],
          ),
          const SizedBox(height: 24),
          PrimaryButton(onTap: () {}, text: 'Continue')
        ],
      ),
    );
  }
}

class PinField extends StatelessWidget {
  const PinField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
      child: TextFormField(
        onSaved: (pin) {},
        onChanged: (pin) {
          if (pin.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
        },
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: "0",
            hintStyle: const TextStyle(color: Color(0xFF757575)),
            border: authOutlineInputBorder,
            enabledBorder: authOutlineInputBorder,
            focusedBorder: authOutlineInputBorder.copyWith(
                borderSide: const BorderSide(color: Color(0xFFFF7643)))),
      ),
    );
  }
}
