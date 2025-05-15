import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CustomCurrencyFormatter extends TextInputFormatter {
  final String locale;
  final String symbol;

  CustomCurrencyFormatter({
    this.locale = 'id_ID',
    this.symbol = 'Rp ',
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Ambil posisi cursor
    int selectionIndex = newValue.selection.baseOffset;

    // Hilangkan karakter non-digit
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (digitsOnly.isEmpty) {
      return TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    final number = int.parse(digitsOnly);
    final formatter = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: 0,
    );
    final newText = formatter.format(number);

    // Hitung offset baru (cursor di akhir teks angka, setelah format)
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
