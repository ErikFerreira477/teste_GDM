import 'package:flutter_test/flutter_test.dart';
import 'package:teste_gdm/app/core/core.dart';

void main() {
  group('StringExtensions', () {
    test('formatCorruptedChars should decode corrupted characters', () {
      const corruptedString = 'ChÃ¡cara Flora - SÃ£o Paulo';
      final decodedString = corruptedString.formatCorruptedChars();

      expect(decodedString, 'Chácara Flora - São Paulo');
    });
  });

  test('formatCorruptedChars should handle null string', () {
    const String? nullString = null;
    final decodedString = nullString?.formatCorruptedChars();

    expect(decodedString, null);
  });

  test('toBRL should format string to BRL currency', () {
    const validNumber = '1234.56';
    final validResult = validNumber.toBRL();
    expect(validResult, 'R\$ 1234,56');
  });

  test('toBRL should format string to BRL currency invalid value', () {
    const invalidNumber = 'abc';
    final invalidResult = invalidNumber.toBRL();
    expect(invalidResult, invalidNumber);
  });

  test('toBRL should handle null string', () {
    const String? nullNumber = null;
    final invalidResult = nullNumber?.toBRL();
    expect(invalidResult, null);
  });
}
