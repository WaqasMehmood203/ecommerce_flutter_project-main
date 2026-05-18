class AFormatException implements Exception {
  final String message;

  const AFormatException(
      [this.message = 'An unexpected format error occurred. Please check your input.']);

  factory AFormatException.fromMessage(String message) {
    return AFormatException(message);
  }

  factory AFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const AFormatException(
            'The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const AFormatException(
            'The phone number format is invalid. Please enter a valid phone number.');
      case 'invalid-password-format':
        return const AFormatException(
            'The password format is invalid. Please ensure your password meets the required criteria.');
      case 'empty-field':
        return const AFormatException(
            'One or more required fields are empty. Please fill in all fields.');
      case 'data-too-large':
        return const AFormatException(
            'The provided data exceeds the maximum allowed size. Please reduce the size of your input.');
      case 'invalid-url-format':
        return const AFormatException(
            'The URL format is invalid. Please provide a valid URL.');
      case 'invalid-username-format':
        return const AFormatException(
            'The username format is invalid. Usernames can only contain alphanumeric characters and underscores.');
      case 'invalid-date-format':
        return const AFormatException(
            'The date format is invalid. Please use a valid date format (e.g., YYYY-MM-DD).');
      case 'invalid-time-format':
        return const AFormatException(
            'The time format is invalid. Please use a valid time format (e.g., HH:MM).');
      case 'invalid-json-format':
        return const AFormatException(
            'The JSON format is invalid. Please ensure the JSON is well-formed.');
      case 'invalid-hex-color':
        return const AFormatException(
            'The color code is invalid. Please use a valid hexadecimal color code (e.g., #FFFFFF).');
      case 'invalid-currency-format':
        return const AFormatException(
            'The currency format is invalid. Please provide a valid currency value.');
      case 'invalid-ip-address':
        return const AFormatException(
            'The IP address format is invalid. Please enter a valid IP address.');
      case 'invalid-mac-address':
        return const AFormatException(
            'The MAC address format is invalid. Please enter a valid MAC address.');
      case 'invalid-ssn-format':
        return const AFormatException(
            'The Social Security Number (SSN) format is invalid.');
      case 'invalid-zipcode-format':
        return const AFormatException(
            'The ZIP code format is invalid. Please enter a valid ZIP code.');
      case 'invalid-alphanumeric-format':
        return const AFormatException(
            'The input contains invalid characters. Only alphanumeric characters are allowed.');
      case 'invalid-credit-card-format':
        return const AFormatException(
            'The credit card number format is invalid. Please check your input.');
      case 'invalid-file-extension':
        return const AFormatException(
            'The file extension is invalid. Please provide a file with an allowed extension.');
      case 'invalid-html-format':
        return const AFormatException(
            'The HTML input is not well-formed. Please check your HTML code.');
      case 'invalid-csv-format':
        return const AFormatException(
            'The CSV format is invalid. Please ensure the CSV is properly structured.');
      case 'invalid-xml-format':
        return const AFormatException(
            'The XML format is invalid. Please ensure the XML is well-formed.');
      default:
        return const AFormatException();
    }
  }

  String get formattedMessage => message;

  @override
  String toString() => 'AFormatException: $message';
}
