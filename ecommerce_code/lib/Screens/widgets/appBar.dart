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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: AppBar(
        leading: CircleAvatar(
            backgroundColor: AppColor.lightGrey3,
            radius: 2,
            child: Icon(
              Icons.menu_sharp,
              size: 25,
            )),
        title: MyLogo(
          height: 60,
          width: 100,
        ),
        actions: [Avatar()],
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: SearchInput(
              textController: searchController,
              hintText: 'Search any Product...'),
        ),
        backgroundColor: AppColor.screenClr,
      ),
    );
  }
}

//

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final IconData? trailingIcon;
  final VoidCallback? onBackPressed;
  final VoidCallback? onTrailingTap;

  const CustomAppBar({
    Key? key,
    this.title,
    this.trailingIcon,
    this.onBackPressed,
    this.onTrailingTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        iconSize: 30,
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
      ),
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
