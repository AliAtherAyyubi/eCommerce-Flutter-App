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
  bool isBorder;
  //
  PrimaryButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.width,
      this.height,
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
        child: Card(
          elevation: widget.elevation ?? 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
          ),
          color: widget.bgColor,
          child: Container(
            height: widget.height ?? 55,
            alignment: Alignment.center,
            width: widget.width ?? 90.w,
            decoration: BoxDecoration(
              border: widget.isBorder
                  ? Border.all(color: AppColor.white, width: 1)
                  : null,
              color: widget.bgColor ?? AppColor.primary,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
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
                        style: AppTypo.button
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
      ),
    );
  }
}

///
///

class CustomButtons extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  const CustomButtons(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 35,
        // width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                  // offset: const Offset(12, 26),
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(0.2)),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: AppTypo.regular14.copyWith(fontSize: 16)),
            const SizedBox(width: 10),
            Icon(
              icon,
              size: 18,
              color: AppColor.black2,
            ),
          ],
        ),
      ),
    );
  }
}
