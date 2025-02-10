import 'package:flutter_test/flutter_test.dart';
import 'package:teste_gdm/app/modules/home/models/models.dart';

void main() {
  group('DescontoModel', () {
    test('should create an instance with a filled value', () {
      final model = DescontoModel(desconto: 10.5);

      expect(model.desconto, 10.5);
    });

    test('should create an instance with a null value', () {
      final model = DescontoModel();

      expect(model.desconto, isNull);
    });

    test('toMap should return a valid map', () {
      final model = DescontoModel(desconto: 10.5);
      final map = model.toMap();

      expect(map, {'desconto': 10.5});
    });

    test('fromMap should create an object correctly', () {
      final map = {'desconto': 10.5};
      final model = DescontoModel.fromMap(map);

      expect(model.desconto, 10.5);
    });

    test('fromMap should handle null values', () {
      final map = {'desconto': null};
      final model = DescontoModel.fromMap(map);

      expect(model.desconto, isNull);
    });

    test('toJson should return a valid JSON string', () {
      final model = DescontoModel(desconto: 10.5);
      final jsonStr = model.toJson();

      expect(jsonStr, '{"desconto":10.5}');
    });

    test('fromJson should create an object correctly', () {
      const jsonStr = '{"desconto":10.5}';
      final model = DescontoModel.fromJson(jsonStr);

      expect(model.desconto, 10.5);
    });

    test('fromJson should handle null values', () {
      const jsonStr = '{"desconto":null}';
      final model = DescontoModel.fromJson(jsonStr);

      expect(model.desconto, isNull);
    });
  });
}
