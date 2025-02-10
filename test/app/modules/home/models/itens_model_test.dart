import 'package:flutter_test/flutter_test.dart';
import 'package:teste_gdm/app/modules/home/models/models.dart';

void main() {
  group('ItensModel', () {
    test('should create an instance with given values', () {
      final model = ItensModel(nome: 'Test Item');

      expect(model.nome, 'Test Item');
    });

    test('should create an instance with null values', () {
      final model = ItensModel();

      expect(model.nome, isNull);
    });

    test('should convert to Map correctly', () {
      final model = ItensModel(nome: 'Test Item');

      expect(model.toMap(), {'nome': 'Test Item'});
    });

    test('should create from Map correctly', () {
      final map = {'nome': 'Test Item'};
      final model = ItensModel.fromMap(map);

      expect(model.nome, 'Test Item');
    });

    test('should convert to JSON correctly', () {
      final model = ItensModel(nome: 'Test Item');

      expect(model.toJson(), '{"nome":"Test Item"}');
    });

    test('should create from JSON correctly', () {
      const jsonStr = '{"nome":"Test Item"}';
      final model = ItensModel.fromJson(jsonStr);

      expect(model.nome, 'Test Item');
    });
  });
}
