import 'package:flutter_test/flutter_test.dart';
import 'package:teste_gdm/app/modules/home/models/models.dart';

void main() {
  group('PeriodosModel', () {
    test('should create an instance with given values', () {
      final model = PeriodosModel(
        tempoFormatado: '1 hour',
        tempo: '1h',
        valor: 100.0,
        valorTotal: 90.0,
        temCortesia: true,
        desconto: DescontoModel(desconto: 10.0),
      );

      expect(model.tempoFormatado, '1 hour');
      expect(model.tempo, '1h');
      expect(model.valor, 100.0);
      expect(model.valorTotal, 90.0);
      expect(model.temCortesia, true);
      expect(model.desconto?.desconto, 10.0);
    });

    test('should create an instance with null values', () {
      final model = PeriodosModel();

      expect(model.tempoFormatado, isNull);
      expect(model.tempo, isNull);
      expect(model.valor, isNull);
      expect(model.valorTotal, isNull);
      expect(model.temCortesia, isNull);
      expect(model.desconto, isNull);
    });

    test('should convert to Map correctly', () {
      final model = PeriodosModel(
        tempoFormatado: '1 hour',
        tempo: '1h',
        valor: 100.0,
        valorTotal: 90.0,
        temCortesia: true,
        desconto: DescontoModel(desconto: 10.0),
      );

      expect(model.toMap(), {
        'tempoFormatado': '1 hour',
        'tempo': '1h',
        'valor': 100.0,
        'valorTotal': 90.0,
        'temCortesia': true,
        'desconto': {'desconto': 10.0},
      });
    });

    test('should create from Map correctly', () {
      final map = {
        'tempoFormatado': '1 hour',
        'tempo': '1h',
        'valor': 100.0,
        'valorTotal': 90.0,
        'temCortesia': true,
        'desconto': {'desconto': 10.0},
      };

      final model = PeriodosModel.fromMap(map);

      expect(model.tempoFormatado, '1 hour');
      expect(model.tempo, '1h');
      expect(model.valor, 100.0);
      expect(model.valorTotal, 90.0);
      expect(model.temCortesia, true);
      expect(model.desconto?.desconto, 10.0);
    });

    test('should convert to JSON correctly', () {
      final model = PeriodosModel(
        tempoFormatado: '1 hour',
        tempo: '1h',
        valor: 100.0,
        valorTotal: 90.0,
        temCortesia: true,
        desconto: DescontoModel(desconto: 10.0),
      );

      expect(model.toJson(),
          '{"tempoFormatado":"1 hour","tempo":"1h","valor":100.0,"valorTotal":90.0,"temCortesia":true,"desconto":{"desconto":10.0}}');
    });

    test('should create from JSON correctly', () {
      const jsonStr =
          '{"tempoFormatado":"1 hour","tempo":"1h","valor":100.0,"valorTotal":90.0,"temCortesia":true,"desconto":{"desconto":10.0}}';
      final model = PeriodosModel.fromJson(jsonStr);

      expect(model.tempoFormatado, '1 hour');
      expect(model.tempo, '1h');
      expect(model.valor, 100.0);
      expect(model.valorTotal, 90.0);
      expect(model.temCortesia, true);
      expect(model.desconto?.desconto, 10.0);
    });
  });
}
