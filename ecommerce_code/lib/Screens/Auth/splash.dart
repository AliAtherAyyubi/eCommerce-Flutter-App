import 'package:ecommerce_code/Screens/Auth/login.dart';
import 'package:ecommerce_code/Screens/onboarding/onboarding.dart';
import 'package:ecommerce_code/Screens/widgets/Components/logo.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.screenClr, body: MyLogo());
  }
}
