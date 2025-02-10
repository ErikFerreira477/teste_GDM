import 'package:flutter_test/flutter_test.dart';
import 'package:teste_gdm/app/modules/home/models/models.dart';

void main() {
  group('CategoriaItensModel', () {
    test('Should create an instance with filled values', () {
      final model = CategoriaItensModel(nome: 'Beverages', icone: 'icon.png');

      expect(model.nome, 'Beverages');
      expect(model.icone, 'icon.png');
    });

    test('Should create an instance with null values', () {
      final model = CategoriaItensModel();

      expect(model.nome, isNull);
      expect(model.icone, isNull);
    });

    test('toMap should return a correct map', () {
      final model = CategoriaItensModel(nome: 'Beverages', icone: 'icon.png');
      final map = model.toMap();

      expect(map, {
        'nome': 'Beverages',
        'icone': 'icon.png',
      });
    });

    test('fromMap should create an object correctly', () {
      final map = {'nome': 'Beverages', 'icone': 'icon.png'};
      final model = CategoriaItensModel.fromMap(map);

      expect(model.nome, 'Beverages');
      expect(model.icone, 'icon.png');
    });

    test('fromMap should handle null values', () {
      final map = {'nome': null, 'icone': null};
      final model = CategoriaItensModel.fromMap(map);

      expect(model.nome, isNull);
      expect(model.icone, isNull);
    });

    test('toJson should return a valid JSON', () {
      final model = CategoriaItensModel(nome: 'Beverages', icone: 'icon.png');
      final jsonStr = model.toJson();

      expect(jsonStr, '{"nome":"Beverages","icone":"icon.png"}');
    });

    test('fromJson should create an object correctly', () {
      const jsonStr = '{"nome":"Beverages","icone":"icon.png"}';
      final model = CategoriaItensModel.fromJson(jsonStr);

      expect(model.nome, 'Beverages');
      expect(model.icone, 'icon.png');
    });

    test('fromJson should handle null values', () {
      const jsonStr = '{"nome":null,"icone":null}';
      final model = CategoriaItensModel.fromJson(jsonStr);

      expect(model.nome, isNull);
      expect(model.icone, isNull);
    });
  });
}
