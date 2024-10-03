import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Validator {
  // Validate Name
  static String? name(String value) {
    if (value.isEmpty) {
      return 'Name is required';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    } else {
      return null;
    }
  }

  // Validate Email
  static String? email(String value) {
    final RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (value.isEmpty) {
      return 'Email is required';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  // Validate Password
  static String? password(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    } else {
      return null;
    }
  }

  // Validate Confirm Password
  static String? confirmPassword(String value, String password) {
    if (value.isEmpty) {
      return 'Confirm Password is required';
    } else if (value != password) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }

  // Validate Phone Number
  static String? validatePhoneNumber(String value) {
    final RegExp phoneRegex = RegExp(r"^[0-9]{10}$"); // Assumes 10 digits
    if (value.isEmpty) {
      return 'Phone number is required';
    } else if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    } else {
      return null;
    }
  }

  ///
  /// Credit Card Valid //
  ///
  // Validate Credit Card Number
  static String? cardNumber(String value) {
    final RegExp cardNumberRegex = RegExp(r"^[0-9]");
    if (value.isEmpty) {
      return 'Card number is required';
    } else if (!cardNumberRegex.hasMatch(value)) {
      return 'Enter a valid 16-digit card number';
    } else {
      return null;
    }
  }

  // Validate Expiry Date (MM/YY)
  static String? expiryDate(String value) {
    if (value.isEmpty) {
      return 'Expiry date is required';
    } else {
      return null;
    }
  }

  // Validate CVV (3 or 4 digits)
  static String? CVV(String value) {
    // final RegExp cvvRegex = RegExp(r"^[0-9]{3,4}$");
    if (value.isEmpty) {
      return 'CVV is required';
    } else {
      return null;
    }
  }

  // Validate Non-empty Field (Generic Validation)
  static String? validateNonEmpty(String value, String fieldName) {
    if (value.isEmpty) {
      return '$fieldName is required';
    } else {
      return null;
    }
  }

  /// Input formaters
  ///
  static var maskCardNumber = new MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  static var maskDate = new MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}
