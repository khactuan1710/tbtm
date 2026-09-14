import 'package:intl/intl.dart';

/// Vietnamese currency / number formatting helpers.
class CurrencyUtils {
  CurrencyUtils._();

  static final NumberFormat _vnd = NumberFormat.decimalPattern('vi_VN');

  /// `1200000` → `"1.200.000 đ"`.
  static String formatVnd(num? amount) {
    if (amount == null) return '0 đ';
    return '${_vnd.format(amount)} đ';
  }

  /// `1200000` → `"1.200.000"` (no suffix).
  static String formatNumber(num? amount) {
    if (amount == null) return '0';
    return _vnd.format(amount);
  }

  /// Parses user input like `"1.200.000"` / `"1,200,000"` → `1200000`.
  static int parseAmount(String? input) {
    if (input == null || input.trim().isEmpty) return 0;
    final digits = input.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(digits) ?? 0;
  }
}
