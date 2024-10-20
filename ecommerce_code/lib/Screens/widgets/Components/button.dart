import 'dart:ui';

import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PrimaryButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius, elevation;
  final double? fontSize;
  final IconData? suffixIcon;
  final bool loading;
  final Color? bgColor;
  TextStyle? textStyle;
  bool isBorder;
  //
  PrimaryButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.width,
      this.height,
      this.textStyle,
      this.elevation,
      this.borderRadius,
      this.fontSize,
      this.loading = false,
      this.isBorder = false,
      // this.textColor,
      this.bgColor,
      this.suffixIcon})
      : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton>
    with SingleTickerProviderStateMixin {
  //
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Container(
          height: widget.height ?? 55,
          alignment: Alignment.center,
          width: widget.width ?? 100.w,
          decoration: BoxDecoration(
            border: widget.isBorder
                ? Border.all(color: AppColor.white, width: 1.5)
                : null,
            color: widget.bgColor ?? AppColor.primary,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
          ),
          child: widget.loading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.text,
                      style: widget.textStyle ??
                          AppTypo.button
                              .copyWith(fontSize: widget.fontSize ?? 20),
                    ),
                    widget.suffixIcon != null
                        ? Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(
                              widget.suffixIcon,
                              size: 20,
                              color: AppColor.white,
                            ),
                          )
                        : Container()
                  ],
                ),
        ),
      ),
    );
  }
}

///
///

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String title;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Border? border;
  final Color? bgColor;
  final TextStyle? textStyle;

  CustomButton({
    super.key,
    required this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    required this.title,
    this.height,
    this.width,
    this.borderRadius,
    this.border,
    this.bgColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: height ?? 35,
        width: width ??
            null, // If width is not provided, container will auto-adjust
        decoration: BoxDecoration(
          color: bgColor ?? AppColor.white,
          border: border,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          // boxShadow: [
          //   BoxShadow(
          //     blurRadius: 10,
          //     spreadRadius: 0,
          //     color: Colors.grey.withOpacity(0.2),
          //   ),
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) prefixIcon!,
            if (prefixIcon != null)
              const SizedBox(width: 10), // Add space if prefixIcon exists
            Text(
              title,
              style: textStyle ?? AppTypo.regular14.copyWith(fontSize: 16),
            ),
            if (suffixIcon != null)
              const SizedBox(width: 10), // Add space if suffixIcon exists
            if (suffixIcon != null) suffixIcon!,
          ],
        ),
      ),
    );
  }
}
