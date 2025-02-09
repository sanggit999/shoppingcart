import 'package:intl/intl.dart';

class FormatCurrencyHelper {
  static formatCurrency(int amount) {
    final formatter = NumberFormat('#,###,###', 'en_US');
    return '${formatter.format(amount)} ₫';
  }
}
