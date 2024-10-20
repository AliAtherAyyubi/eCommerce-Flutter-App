import 'package:ecommerce_code/Screens/Cart/Payment/payment.dart';
import 'package:ecommerce_code/Screens/Cart/cart.dart';
import 'package:ecommerce_code/Screens/Home/home.dart';
import 'package:ecommerce_code/Screens/Settings/setting.dart';
import 'package:ecommerce_code/Screens/search.dart';
import 'package:ecommerce_code/Screens/widgets/Components/navBar.dart';
import 'package:ecommerce_code/Screens/widgets/Components/navbar2.dart';
import 'package:ecommerce_code/Screens/wishList/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    WishListScreen(),
    SettingsScreen()
  ];
  List<PersistentBottomNavBarItem> items = [
    myNavBarItem(iconData: Icons.home_filled, title: 'Home'),
    myNavBarItem(iconData: CupertinoIcons.search, title: 'Search'),
    myNavBarItem(iconData: Icons.shopping_cart_outlined, title: 'Cart'),
    myNavBarItem(iconData: Icons.favorite_border, title: 'Wishlist'),
    myNavBarItem(iconData: Icons.settings, title: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomNavBar(screens: screens, items: items);
  }
}
