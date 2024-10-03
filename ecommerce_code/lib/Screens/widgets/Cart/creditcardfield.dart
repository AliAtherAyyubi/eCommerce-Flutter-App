import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreditCardField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final int? maxLength;

  final String? suffixImg;
  final Color? iconClr;
  final TextInputFormatter? inputFormatter;

  ////
  const CreditCardField({
    required this.controller,
    required this.hintText,
    this.validator,
    this.inputFormatter,
    // this.titleColor,
    this.maxLength,
    this.iconClr,
    this.keyboardType,
    this.suffixImg,
    this.onChange,
    super.key,
  });

  @override
  State<CreditCardField> createState() => _CreditCardFieldState();
}

class _CreditCardFieldState extends State<CreditCardField> {
  // bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        onChanged: widget.onChange,
        maxLength: widget.maxLength ?? 10,
        autocorrect: true,

        style: AppTypo.medium16.copyWith(fontSize: 14, color: Colors.white),
        //
        cursorColor: Colors.white,
        cursorErrorColor: Colors.white,
        keyboardType: widget.keyboardType,
        inputFormatters:
            widget.inputFormatter != null ? [widget.inputFormatter!] : null,
        // Style //

        decoration: InputDecoration(
          counterText: '',
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25,
          ),
          filled: true,
          fillColor: Colors.black,
          hintText: widget.hintText,
          hintStyle:
              AppTypo.medium12.copyWith(color: Colors.white, fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
            // borderSide: const BorderSide(
            //   color: Color(0xffA8A8A9), // Border color
            //   width: 2,
            //   // Border width
            // ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
            borderSide: BorderSide.none,
          ),
          suffixIcon: widget.suffixImg != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset(
                    widget.suffixImg ?? 'assets/icons/mastercard.png',
                    height: 20,
                    width: 40,
                    fit: BoxFit.contain,
                    color: widget.iconClr,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
