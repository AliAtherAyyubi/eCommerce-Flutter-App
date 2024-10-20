import 'package:ecommerce_code/Screens/Auth/forgot.dart';
import 'package:ecommerce_code/Screens/Auth/login.dart';
import 'package:ecommerce_code/Screens/Auth/register.dart';
import 'package:ecommerce_code/Screens/Auth/welcome.dart';
import 'package:ecommerce_code/Screens/Cart/cart.dart';
import 'package:ecommerce_code/Screens/Cart/Payment/payment.dart';
import 'package:ecommerce_code/Screens/Cart/prdouctDetail.dart';
import 'package:ecommerce_code/Screens/Home/home.dart';
import 'package:ecommerce_code/Screens/MainScreen.dart';
import 'package:ecommerce_code/Screens/Order/orders.dart';
import 'package:ecommerce_code/Screens/Settings/addAddress.dart';
import 'package:ecommerce_code/Screens/Settings/address.dart';
import 'package:ecommerce_code/Screens/Settings/newCard.dart';
import 'package:ecommerce_code/Screens/Settings/notify.dart';
import 'package:ecommerce_code/Screens/Settings/passwrod.dart';
import 'package:ecommerce_code/Screens/Settings/pay_method.dart';
import 'package:ecommerce_code/Screens/Settings/setting.dart';
import 'package:ecommerce_code/Screens/onboarding/onboarding.dart';
import 'package:ecommerce_code/Screens/Auth/splash.dart';
import 'package:ecommerce_code/Screens/widgets/Cart/placeOrder.dart';
import 'package:ecommerce_code/Screens/Order/orderDetail.dart';
import 'package:ecommerce_code/Screens/widgets/home/productCard.dart';
import 'package:ecommerce_code/Screens/wishList/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:device_preview/device_preview.dart';

//
void main() {
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) => const MyApp(),
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainScreen(),
      );
    });
  }
}
