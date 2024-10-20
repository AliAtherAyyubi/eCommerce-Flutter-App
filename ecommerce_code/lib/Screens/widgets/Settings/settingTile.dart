import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColor.lightGrey))),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        titleAlignment: ListTileTitleAlignment.center,
        leading: Container(
          height: 38,
          width: 38,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.lightGrey),
              borderRadius: BorderRadius.circular(50)),
          child: Icon(
            icon,
            size: 18,
          ),
        ),
        title: Text(
          title,
          style: AppTypo.medium14, // Using your AppTypo for title style
        ),
        subtitle: Text(
          subtitle,
          style: AppTypo.regular12.copyWith(
              color: AppColor.grey500), // Using your AppTypo for subtitle style
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 18.sp,
        ),
        onTap: onTap,
      ),
    );
  }
}
