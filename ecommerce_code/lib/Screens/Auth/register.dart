import 'package:ecommerce_code/Screens/Auth/login.dart';
import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/textfield.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Create an \naccount', style: AppTypo.h1)),

                const SizedBox(height: 50),
                // Email Field.
                AuthField(
                  title: 'Email Address',
                  hintText: 'Username or Email',
                  prefixIcon: Icons.person,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                // Password Field.
                AuthField(
                  title: 'Password',
                  prefixIcon: Icons.lock,
                  hintText: 'Password',
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 8) {
                      return 'Password should be at least 8 characters long';
                    }
                    return null;
                  },
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                AuthField(
                  title: 'ConfiPassword',
                  prefixIcon: Icons.lock,
                  hintText: 'ConfirmPassword',
                  controller: _confirmpasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    } else if (_passwordController !=
                        _confirmpasswordController) {
                      return 'Password don\'t match!';
                    }
                    return null;
                  },
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                // Button //
                SizedBox(
                  height: 10,
                ),
                AgreeText(),
                SizedBox(
                  height: 25,
                ),
                PrimaryButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  text: 'Create Account',
                ),

                /////

                const SizedBox(height: 25),
                const TextWithDivider(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocialButton(
                      onTap: () {},
                      icon: FontAwesomeIcons.google,
                    ),
                    CustomSocialButton(
                      onTap: () {},
                      icon: FontAwesomeIcons.apple,
                    ),
                    CustomSocialButton(
                      onTap: () {},
                      icon: FontAwesomeIcons.facebookF,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                RichText(
                  text: TextSpan(
                    text: 'I Already have an account? ',
                    style: AppTypo.regular14.copyWith(color: AppColor.black),
                    children: [
                      TextSpan(
                          text: 'Login',
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: AppTypo.semibold14.copyWith(
                            decoration: TextDecoration.underline,
                            color: AppColor.primary,
                          )),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AgreeText extends StatelessWidget {
  const AgreeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: 'By clicking the ',
          style: AppTypo.regular14
              .copyWith(color: AppColor.darkGrey, fontSize: 12),
          children: [
            TextSpan(
                text: 'Register ',
                style: AppTypo.regular14.copyWith(
                  fontSize: 12,
                  color: AppColor.primary,
                )),
            TextSpan(
                text: 'button, you agree to public offer',
                style: AppTypo.regular14.copyWith(
                  fontSize: 12,
                  color: AppColor.darkGrey,
                )),
          ],
        ),
      ),
    );
  }
}
