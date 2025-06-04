import 'package:intl/intl.dart';

class AppFormatter {
  static const Map<String, String> currencies = {
    'GHS': 'GH₵',
    'GHC': 'GH₵',
    'KES': 'KSh',
    'USD': r'$',
    'EUR': '€',
    'GBP': '£',
    'NGN': '₦',
    'ZAR': 'R',
  };

  static final _compact = NumberFormat.compact();
  static final _compactExplicit =
      NumberFormat.compact(explicitSign: true, locale: '"en_US"');
  static final _decimal = NumberFormat('.00');
  static final _amount = NumberFormat('#,##0.##');
  static final _wholeNumber = NumberFormat('#,##0');

  static String money(
    num value, {
    String currency = 'USD',
    int decimalDigits = 2,
    bool symbolFirst = true,
    String spacing = '',
  }) {
    final symbol = (currencies[currency] ?? currency) + spacing;
    final amount = NumberFormat.currency(
      symbol: '',
      decimalDigits: decimalDigits,
    ).format(value);

    return symbolFirst ? '$symbol$amount' : '$amount$symbol';
  }

  static String payout(
    num value,
  ) {
    final amount =
        NumberFormat.currency(symbol: '', decimalDigits: 0).format(value);

    return amount;
  }

  static String compactMoney(
    num value, {
    String currency = 'USD',
    int decimalDigits = 1,
    bool symbolFirst = true,
    bool isExplicit = false,
  }) {
    final symbol = currencies[currency] ?? currency;
    final amount =
        isExplicit ? _compactExplicit.format(value) : _compact.format(value);

    return symbolFirst ? '$symbol$amount' : '$amount$symbol';
  }

  static String compact(num value) => _compact.format(value);
  static String amount(num value) => _amount.format(value);
  static String decimal(num value) {
    if (value % 1 == 0) return '';
    return _decimal.format(value % 1);
  }

  static String whole(num value) => _wholeNumber.format(value);
  static String percentage(num value, {int decimalDigits = 1}) {
    final percentFormat = NumberFormat.percentPattern()
      ..maximumFractionDigits = decimalDigits;
    return percentFormat.format(value);
  }
}
