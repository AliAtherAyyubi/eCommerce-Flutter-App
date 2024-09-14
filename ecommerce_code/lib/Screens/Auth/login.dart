import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/textfield.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _NgamarSignInViewState();
}

class _NgamarSignInViewState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                    child: Text('Welcome \nBack!', style: AppTypo.h1)),

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
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Spacer(),
                    CustomTextButton(
                      onPressed: () {},
                      text: 'Forgot Password?',
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // Button //

                PrimaryButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  text: 'Login',
                ),

                /////

                const SizedBox(height: 20),
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
                    text: 'Don’t have an account? ',
                    style:
                        AppTypo.regular14.copyWith(color: AppColor.lightDark),
                    children: [
                      TextSpan(
                          text: 'Sign Up',
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

// class AgreeTermsTextCard extends StatelessWidget {
//   const AgreeTermsTextCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 40),
//       child: RichText(
//         text: TextSpan(
//           text: 'By signing up you agree to our ',
//           style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//               color: AppColors.kGrey70),
//           children: [
//             TextSpan(
//                 text: 'Terms',
//                 recognizer: TapGestureRecognizer()..onTap = () {},
//                 style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.kGrey100)),
//             const TextSpan(
//                 text: ' and ',
//                 style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.kGrey70)),
//             TextSpan(
//                 text: 'Conditions of Use',
//                 recognizer: TapGestureRecognizer()..onTap = () {},
//                 style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.kGrey100)),
//           ],
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }

class CustomSocialButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  const CustomSocialButton({
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  State<CustomSocialButton> createState() => _CustomSocialButtonState();
}

class _CustomSocialButtonState extends State<CustomSocialButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(right: 15),
          height: 70,
          width: 70,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColor.primary),
            color: AppColor.lightRed,
          ),
          child: Icon(
            widget.icon,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class TextWithDivider extends StatelessWidget {
  const TextWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColor.grey,
          ),
        ),
        SizedBox(width: 20),
        Text(
          'OR Continue with',
          style: AppTypo.medium12.copyWith(
            color: AppColor.lightDark,
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Divider(color: AppColor.grey),
        ),
      ],
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final double? fontSize;
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: AppColor.primary,
          fontSize: fontSize ?? 14,
        ),
      ),
    );
  }
}
