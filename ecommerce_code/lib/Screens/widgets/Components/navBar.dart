import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

//
//
class CustomNavBar extends StatefulWidget {
  final List<Widget> screens;
  final List<PersistentBottomNavBarItem> items;
  final int initialIndex;

  CustomNavBar({
    required this.screens,
    required this.items,
    this.initialIndex = 0,
  });

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  PersistentTabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: widget.screens,
      items: widget.items,
      navBarHeight: 55,
      backgroundColor: Colors.white,
      hideOnScrollSettings: HideOnScrollSettings(
        hideNavBarOnScroll: true,
      ),
      padding: EdgeInsets.symmetric(vertical: 2),
      handleAndroidBackButtonPress: true,
      navBarStyle: NavBarStyle.style13,
    );
  }
}

PersistentBottomNavBarItem myNavBarItem({
  required IconData iconData,
  required String title,
}) {
  return PersistentBottomNavBarItem(
    icon: Icon(
      iconData,
    ),
    iconSize: 30,
    title: title,
    textStyle: AppTypo.regular12,
    activeColorPrimary: AppColor.dprimary,
    inactiveColorSecondary: Colors.white,
    inactiveColorPrimary: Colors.black,
  );
}
