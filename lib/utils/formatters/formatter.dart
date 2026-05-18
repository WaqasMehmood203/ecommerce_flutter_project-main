import 'package:intl/intl.dart';

class AFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy')
        .format(date); //customize the date format as needed
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    //Assuming a 10 digit US phone number format : (123) 456-7890
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }

    //Add more custom phone number formatting logic for different formats if needed
    return phoneNumber;
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Ensure there are at least 2 digits for the country code
    if (digitsOnly.length < 2) {
      throw ArgumentError('Phone number is too short.');
    }

    // Extract the country code
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    // Format the remaining digits
    final formattedNumber = StringBuffer();
    formattedNumber.write('$countryCode ');

    for (int i = 0; i < digitsOnly.length; i++) {
      // Add a space after every 3 digits
      formattedNumber.write(digitsOnly[i]);
      if ((i + 1) % 3 == 0 && i + 1 < digitsOnly.length) {
        formattedNumber.write(' ');
      }
    }

    return formattedNumber.toString();
  }
}
