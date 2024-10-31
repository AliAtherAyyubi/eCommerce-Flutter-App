import 'package:ecommerce_code/Screens/widgets/Components/avatar.dart';
import 'package:ecommerce_code/Screens/widgets/Components/logo.dart';
import 'package:ecommerce_code/Screens/widgets/Components/textfield.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  TextEditingController searchController;
  HomeAppBar({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: CircleAvatar(
      //     backgroundColor: AppColor.lightGrey3,
      //     radius: 2,
      //     child: Icon(
      //       Icons.menu_sharp,
      //       size: 25,
      //     )),

      title: MyLogo(
        height: 60,
        width: 100,
      ),
      actions: [Padding(padding: EdgeInsets.only(right: 20), child: Avatar())],
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: SearchInput(
              textController: searchController,
              hintText: 'Search any Product...'),
        ),
      ),
      elevation: 0,
      backgroundColor: AppColor.screenClr,
    );
  }
}

//

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final IconData? trailingIcon;
  final VoidCallback? onBackPressed;
  final VoidCallback? onTrailingTap;
  bool isleading;

  CustomAppBar({
    Key? key,
    this.title,
    this.trailingIcon,
    this.isleading = true,
    this.onBackPressed,
    this.onTrailingTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isleading
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              iconSize: 30,
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            )
          : null,
      title: title != null
          ? Text(
              title!,
              style: AppTypo.semibold14.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            )
          : null,
      centerTitle: true,
      actions: [
        if (trailingIcon != null)
          IconButton(
            icon: Icon(trailingIcon, color: Colors.black),
            onPressed: onTrailingTap,
          ),
      ],
      backgroundColor: AppColor.screenClr,
      elevation: 0, // Optional: no shadow
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
