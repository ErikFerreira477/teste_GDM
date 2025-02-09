import 'dart:convert';

extension StringExtensions on String {
  String formatCorruptedChars() => utf8.decode(runes.toList());

  String toBRL() {
    final value = double.tryParse(this);
    if (value == null) return this;
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }
}
