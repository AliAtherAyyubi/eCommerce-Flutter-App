import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypo {
  // Heading Styles with different weights
  static TextStyle h1 = GoogleFonts.montserrat(
    fontSize: 36,
    fontWeight: FontWeight.w700, // Bold
    color: AppColor.black,
  );

  static TextStyle h2 = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );

  static TextStyle h3 = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w400, // Regular
    color: Colors.black,
  );

  static TextStyle bold = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w700, // bold
    color: Colors.black,
  );
  // Body Text Styles with different weights
  static TextStyle semibold14 = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w600, // semibold
    color: Colors.black,
  );
  static TextStyle medium12 = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500, // medium
    color: Colors.black,
  );
  static TextStyle medium14 = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500, // medium
    color: Colors.black,
  );
  static TextStyle medium16 = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w500, // medium
    color: Colors.black,
  );

  static TextStyle regular14 = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400, // regular
    color: Colors.black,
  );
  static TextStyle regular = GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w400, // regular
    color: Colors.black,
  );
  static TextStyle regular12 = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400, // regular
    color: Colors.black,
  );
  static TextStyle light12 = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w300, // light
    color: Colors.black,
  );

  // Caption Text Style with lighter weight
  static TextStyle placeholder = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500, // medium
    color: AppColor.darkGrey,
  );

  // Button Text Style with extra-bold weight
  static TextStyle button = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w600, // semibold
    color: Colors.white,
  );
  static TextStyle button2 = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600, // semibold
    color: Colors.white,
  );
  static TextStyle boldButton = GoogleFonts.montserrat(
    fontSize: 22,
    fontWeight: FontWeight.w800, //
    color: Colors.white,
  );

  ///
  static TextStyle productTitle = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w500, //
    color: AppColor.black,
  );
  static TextStyle pro_desc = GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w500, //
    color: AppColor.black,
  );
}
