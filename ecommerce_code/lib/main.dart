import 'package:ecommerce_code/Screens/Auth/forgot.dart';
import 'package:ecommerce_code/Screens/Auth/login.dart';
import 'package:ecommerce_code/Screens/Auth/register.dart';
import 'package:ecommerce_code/Screens/Auth/welcome.dart';
import 'package:ecommerce_code/Screens/Home/home.dart';
import 'package:ecommerce_code/Screens/onboarding/onboarding.dart';
import 'package:ecommerce_code/Screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:device_preview/device_preview.dart';

//
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      );
    });
  }
}
