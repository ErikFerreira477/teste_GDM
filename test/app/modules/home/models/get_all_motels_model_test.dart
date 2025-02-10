import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_gdm/app/modules/home/models/models.dart';

void main() {
  group('GetAllMotelsModel', () {
    final data = GetAllMotelsDataModel();

    test('should create an instance with filled values', () {
      final model = GetAllMotelsModel(
        sucesso: true,
        data: data,
        mensagem: ['Success message'],
      );

      expect(model.sucesso, true);
      expect(model.data, isNotNull);
      expect(model.mensagem, isNotNull);
      expect(model.mensagem!.length, 1);
      expect(model.mensagem!.first, 'Success message');
    });

    test('should create an instance with null values', () {
      final model = GetAllMotelsModel();

      expect(model.sucesso, isNull);
      expect(model.data, isNull);
      expect(model.mensagem, isNull);
    });

    test('toMap should return a valid map', () {
      final model = GetAllMotelsModel(
        sucesso: true,
        data: data,
        mensagem: ['Success'],
      );

      final map = model.toMap();

      expect(map['sucesso'], true);
      expect(map['data'], isNotNull);
      expect(map['mensagem'], isNotNull);
      expect(map['mensagem'], contains('Success'));
    });

    test('fromMap should create an object correctly', () {
      final map = {
        'sucesso': true,
        'data': null,
        'mensagem': ['Success'],
      };

      final model = GetAllMotelsModel.fromMap(map);

      expect(model.sucesso, true);
      expect(model.data, isNull);
      expect(model.mensagem, isNotNull);
      expect(model.mensagem!.first, 'Success');
    });

    test('fromMap should handle null values', () {
      final map = {
        'sucesso': null,
        'data': null,
        'mensagem': null,
      };

      final model = GetAllMotelsModel.fromMap(map);

      expect(model.sucesso, isNull);
      expect(model.data, isNull);
      expect(model.mensagem, isNull);
    });

    test('toJson should return a valid JSON string', () {
      final model = GetAllMotelsModel(
        sucesso: true,
        data: data,
        mensagem: ['Success'],
      );

      final jsonStr = model.toJson();
      final decoded = json.decode(jsonStr);

      expect(decoded['sucesso'], true);
      expect(decoded['data'], isNotNull);
      expect(decoded['mensagem'], contains('Success'));
    });

    test('fromJson should parse JSON correctly', () {
      const jsonStr = '''
      {
        "sucesso": true,
        "data": {},
        "mensagem": ["Success"]
      }
      ''';

      final model = GetAllMotelsModel.fromJson(jsonStr);

      expect(model.sucesso, true);
      expect(model.data, isNotNull);
      expect(model.mensagem, contains('Success'));
    });

    test('fromJson should handle null values', () {
      const jsonStr = '''
      {
        "sucesso": null,
        "data": null,
        "mensagem": null
      }
      ''';

      final model = GetAllMotelsModel.fromJson(jsonStr);

      expect(model.sucesso, isNull);
      expect(model.data, isNull);
      expect(model.mensagem, isNull);
    });
  });
}
