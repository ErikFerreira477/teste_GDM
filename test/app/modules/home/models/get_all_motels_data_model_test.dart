import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_gdm/app/modules/home/models/models.dart';

void main() {
  group('GetAllMotelsDataModel', () {
    final motel = MotelModel();

    test('should create an instance with filled values', () {
      final model = GetAllMotelsDataModel(
        pagina: 1,
        qtdPorPagina: 10,
        totalSuites: 50,
        totalMoteis: 5,
        raio: 20.0,
        maxPaginas: 3.0,
        moteis: [motel],
      );

      expect(model.pagina, 1);
      expect(model.qtdPorPagina, 10);
      expect(model.totalSuites, 50);
      expect(model.totalMoteis, 5);
      expect(model.raio, 20.0);
      expect(model.maxPaginas, 3.0);
      expect(model.moteis, isNotNull);
      expect(model.moteis!.length, 1);
    });

    test('should create an instance with null values', () {
      final model = GetAllMotelsDataModel();

      expect(model.pagina, isNull);
      expect(model.qtdPorPagina, isNull);
      expect(model.totalSuites, isNull);
      expect(model.totalMoteis, isNull);
      expect(model.raio, isNull);
      expect(model.maxPaginas, isNull);
      expect(model.moteis, isNull);
    });

    test('toMap should return a valid map', () {
      final model = GetAllMotelsDataModel(
        pagina: 1,
        qtdPorPagina: 10,
        totalSuites: 50,
        totalMoteis: 5,
        raio: 20.0,
        maxPaginas: 3.0,
        moteis: [motel],
      );

      final map = model.toMap();

      expect(map['pagina'], 1);
      expect(map['qtdPorPagina'], 10);
      expect(map['totalSuites'], 50);
      expect(map['totalMoteis'], 5);
      expect(map['raio'], 20.0);
      expect(map['maxPaginas'], 3.0);
      expect(map['moteis'], isNotNull);
    });

    test('fromMap should create an object correctly', () {
      final map = {
        'pagina': 1,
        'qtdPorPagina': 10,
        'totalSuites': 50,
        'totalMoteis': 5,
        'raio': 20.0,
        'maxPaginas': 3.0,
        'moteis': [],
      };

      final model = GetAllMotelsDataModel.fromMap(map);

      expect(model.pagina, 1);
      expect(model.qtdPorPagina, 10);
      expect(model.totalSuites, 50);
      expect(model.totalMoteis, 5);
      expect(model.raio, 20.0);
      expect(model.maxPaginas, 3.0);
      expect(model.moteis, isNotNull);
    });

    test('fromMap should handle null values', () {
      final map = {
        'pagina': null,
        'qtdPorPagina': null,
        'totalSuites': null,
        'totalMoteis': null,
        'raio': null,
        'maxPaginas': null,
        'moteis': null,
      };

      final model = GetAllMotelsDataModel.fromMap(map);

      expect(model.pagina, isNull);
      expect(model.qtdPorPagina, isNull);
      expect(model.totalSuites, isNull);
      expect(model.totalMoteis, isNull);
      expect(model.raio, isNull);
      expect(model.maxPaginas, isNull);
      expect(model.moteis, isNull);
    });

    test('toJson should return a valid JSON string', () {
      final model = GetAllMotelsDataModel(
        pagina: 1,
        qtdPorPagina: 10,
        totalSuites: 50,
        totalMoteis: 5,
        raio: 20.0,
        maxPaginas: 3.0,
        moteis: [motel],
      );

      final jsonStr = model.toJson();
      final decoded = json.decode(jsonStr);

      expect(decoded['pagina'], 1);
      expect(decoded['qtdPorPagina'], 10);
      expect(decoded['totalSuites'], 50);
      expect(decoded['totalMoteis'], 5);
      expect(decoded['raio'], 20.0);
      expect(decoded['maxPaginas'], 3.0);
      expect(decoded['moteis'], isNotNull);
    });

    test('fromJson should parse JSON correctly', () {
      const jsonStr = '''
      {
        "pagina": 1,
        "qtdPorPagina": 10,
        "totalSuites": 50,
        "totalMoteis": 5,
        "raio": 20.0,
        "maxPaginas": 3.0,
        "moteis": []
      }
      ''';

      final model = GetAllMotelsDataModel.fromJson(jsonStr);

      expect(model.pagina, 1);
      expect(model.qtdPorPagina, 10);
      expect(model.totalSuites, 50);
      expect(model.totalMoteis, 5);
      expect(model.raio, 20.0);
      expect(model.maxPaginas, 3.0);
      expect(model.moteis, isNotNull);
    });
  });
}
