import 'dart:math';

import 'package:intl/intl.dart';

class TimeFormat {
  static String formatDate(String date) {
    String dateString = date;

    // Parse the date string into a DateTime object
    DateTime dateTime = DateTime.parse(dateString);

    // Format it to the desired output
    String formattedDate = DateFormat("dd MMM yyyy").format(dateTime);

    return formattedDate;
  }
  //

  static String randomDate() {
    // Define a random instance
    Random random = Random();

    // Set a random year within a desired range, for example from 2000 to 2025
    int year = random.nextInt(4) + 2020;

    // Generate a random month and a random day based on the month and leap year logic
    int month = random.nextInt(12) + 1;
    int day;

    // Set the max days in the month
    if (month == 2) {
      bool isLeapYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
      day = random.nextInt(isLeapYear ? 29 : 28) + 1;
    } else if ([4, 6, 9, 11].contains(month)) {
      day = random.nextInt(30) + 1;
    } else {
      day = random.nextInt(31) + 1;
    }

    // Create a date from the generated day, month, and year
    DateTime randomDate = DateTime(year, month, day);

    String formattedDate = DateFormat("dd MMM yyyy").format(randomDate);

    // Format the date as desired
    return formattedDate;
  }
}
