import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ecommerce_code/Utils/typo.dart'; // Assuming this contains your text styles

class SecondaryTabbar extends StatefulWidget {
  final double radius;
  const SecondaryTabbar({super.key, this.radius = 18});

  @override
  _SecondaryTabbarState createState() => _SecondaryTabbarState();
}

class _SecondaryTabbarState extends State<SecondaryTabbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      height: 60,
      width: 70.w,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColor.secondary, // Tab background color
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: Row(
        children: [
          // First Tab: 'Current'
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                      _selectedIndex == 0 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(widget.radius),
                ),
                child: Center(
                  child: Text(
                    'Current',
                    style: AppTypo.medium12.copyWith(
                      fontSize: 14,
                      color: _selectedIndex == 0
                          ? AppColor.primary
                          : Colors.white, // Active or Inactive color
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Second Tab: 'Contact'
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                      _selectedIndex == 1 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(widget.radius),
                ),
                child: Center(
                  child: Text(
                    'History',
                    style: AppTypo.medium12.copyWith(
                      fontSize: 14,
                      color: _selectedIndex == 1
                          ? AppColor.primary
                          : Colors.white, // Active or Inactive color
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
