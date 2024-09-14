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
  final double? borderRadius;
  final IconData? prefixIcon;
  final Color? backClr;
  final TextStyle? hintStyle;
  const AuthField({
    this.title,
    required this.hintText,
    required this.controller,
    this.validator,
    // this.titleColor,
    this.maxLines,
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
    return Container(
      margin: EdgeInsets.only(bottom: 10),
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
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25,
          ),
          filled: true,
          fillColor: widget.backClr ?? AppColor.lightGrey2,
          // prefix: Image.asset(
          //   'assets/icons/menu.png',
          //   height: 20,
          //   width: 20,
          //   fit: BoxFit.cover,
          // ),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
              AppTypo.medium12.copyWith(color: AppColor.darkGrey, fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                widget.borderRadius ?? 10), // Rounded corners
            borderSide: const BorderSide(
              color: Color(0xffA8A8A9), // Border color
              width: 2,
              // Border width
            ),
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            size: 25,
            color: AppColor.darkGrey2,
          ),
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
  const SearchInput(
      {required this.textController, required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80,
      width: 95.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            // offset: const Offset(12, 26),
            blurRadius: 10,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(0.2)),
      ]),
      child: TextField(
        controller: textController,
        onChanged: (value) {
          //Do something wi
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: AppColor.grey2,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: AppTypo.regular14.copyWith(color: AppColor.grey2),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
