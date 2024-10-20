import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthField extends StatefulWidget {
  final String? title;
  final String hintText;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  final int? maxLines;
  final double? height;
  final double? borderRadius;
  final IconData? prefixIcon;
  final Color? backClr;
  final TextStyle? hintStyle;
  const AuthField({
    this.title,
    required this.controller,
    required this.hintText,
    this.validator,
    // this.titleColor,
    this.maxLines,
    this.height,
    this.backClr,
    this.borderRadius,
    this.hintStyle,
    this.prefixIcon,
    this.textInputAction,
    this.keyboardType,
    this.isPassword = false,
    super.key,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder borderStyle = OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(widget.borderRadius ?? 10), // Rounded corners
      borderSide: const BorderSide(
        color: Color(0xffBFBFBF), // Border color
        width: 1,
        // Border width
      ),
    );
    return Container(
      // height: widget.height ?? 60,
      margin: EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        maxLines: widget.isPassword ? 1 : widget.maxLines,
        autocorrect: true,
        style: AppTypo.regular14.copyWith(fontSize: 18),
        // ignore: avoid_bool_literals_in_conditional_expressions
        obscureText: widget.isPassword ? isObscure : false,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        // Style //
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          filled: true,
          fillColor: widget.backClr ?? AppColor.white,
          // prefix: Image.asset(
          //   'assets/icons/menu.png',
          //   height: 20,
          //   width: 20,
          //   fit: BoxFit.cover,
          // ),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
              AppTypo.medium12.copyWith(color: AppColor.darkGrey, fontSize: 14),
          border: borderStyle,
          enabledBorder: borderStyle,
          focusedBorder: borderStyle,
          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                  size: 25,
                  color: AppColor.darkGrey2,
                )
              : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                      color: AppColor.darkGrey2),
                )
              : null,
        ),
      ),
    );
  }
}

//

class SearchInput extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double? height;
  final Color? fillColor;
  final VoidCallback? onTap;
  SearchInput(
      {required this.textController,
      required this.hintText,
      this.height,
      this.fillColor,
      this.onTap,
      super.key});
  OutlineInputBorder borderStyle = const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height ?? 80,
      width: 95.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            // offset: const Offset(12, 26),
            blurRadius: 10,
            spreadRadius: 0,
            color: AppColor.grey500.withOpacity(0.2)),
      ]),
      child: TextField(
        controller: textController,
        onChanged: (value) {
          //Do something wi
        },
        onTap: onTap,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: AppColor.grey2,
          ),
          filled: true,
          fillColor: fillColor ?? Colors.white,
          hintText: hintText,
          hintStyle: AppTypo.regular14.copyWith(color: AppColor.grey2),
          contentPadding: AppLayout.screenSpace,
          border: borderStyle,
          enabledBorder: borderStyle,
          focusedBorder: borderStyle,
        ),
      ),
    );
  }
}
