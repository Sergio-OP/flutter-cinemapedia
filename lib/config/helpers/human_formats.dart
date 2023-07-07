import 'package:intl/intl.dart';

class HumanFormats {

  static String number (double number, [int decimalDigits = 0]) {
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: decimalDigits,
      locale: 'en',
      symbol: ''
    ).format(number);
    return formattedNumber;
  }
}