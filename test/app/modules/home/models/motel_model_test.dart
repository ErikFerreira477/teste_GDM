import 'package:flutter_test/flutter_test.dart';
import 'package:teste_gdm/app/modules/home/models/models.dart';

void main() {
  group('MotelModel', () {
    test('should create an instance with given values', () {
      final model = MotelModel(
        fantasia: 'Test Motel',
        logo: 'logo_url',
        bairro: 'Test Neighborhood',
        distancia: 5.0,
        qtdFavoritos: 10,
        suites: [SuitesModel(nome: 'Suite 1')],
        qtdAvaliacoes: 50,
        media: 4.5,
      );

      expect(model.fantasia, 'Test Motel');
      expect(model.logo, 'logo_url');
      expect(model.bairro, 'Test Neighborhood');
      expect(model.distancia, 5.0);
      expect(model.qtdFavoritos, 10);
      expect(model.suites?.first.nome, 'Suite 1');
      expect(model.qtdAvaliacoes, 50);
      expect(model.media, 4.5);
    });

    test('should create an instance with null values', () {
      final model = MotelModel();

      expect(model.fantasia, isNull);
      expect(model.logo, isNull);
      expect(model.bairro, isNull);
      expect(model.distancia, isNull);
      expect(model.qtdFavoritos, isNull);
      expect(model.suites, isNull);
      expect(model.qtdAvaliacoes, isNull);
      expect(model.media, isNull);
    });

    test('should convert to Map correctly', () {
      final model = MotelModel(
        fantasia: 'Test Motel',
        logo: 'logo_url',
        bairro: 'Test Neighborhood',
        distancia: 5.0,
        qtdFavoritos: 10,
        suites: [SuitesModel(nome: 'Suite 1')],
        qtdAvaliacoes: 50,
        media: 4.5,
      );

      expect(model.toMap(), {
        'fantasia': 'Test Motel',
        'logo': 'logo_url',
        'bairro': 'Test Neighborhood',
        'distancia': 5.0,
        'qtdFavoritos': 10,
        'suites': [
          {
            'nome': 'Suite 1',
            'qtd': null,
            'exibirQtdDisponiveis': null,
            'fotos': null,
            'itens': null,
            'categoriaItens': null,
            'periodos': null
          }
        ],
        'qtdAvaliacoes': 50,
        'media': 4.5,
      });
    });

    test('should create from Map correctly', () {
      final map = {
        'fantasia': 'Test Motel',
        'logo': 'logo_url',
        'bairro': 'Test Neighborhood',
        'distancia': 5.0,
        'qtdFavoritos': 10,
        'suites': [
          {'nome': 'Suite 1'}
        ],
        'qtdAvaliacoes': 50,
        'media': 4.5,
      };

      final model = MotelModel.fromMap(map);

      expect(model.fantasia, 'Test Motel');
      expect(model.logo, 'logo_url');
      expect(model.bairro, 'Test Neighborhood');
      expect(model.distancia, 5.0);
      expect(model.qtdFavoritos, 10);
      expect(model.suites?.first.nome, 'Suite 1');
      expect(model.qtdAvaliacoes, 50);
      expect(model.media, 4.5);
    });

    test('should convert to JSON correctly', () {
      final model = MotelModel(
        fantasia: 'Test Motel',
        logo: 'logo_url',
        bairro: 'Test Neighborhood',
        distancia: 5.0,
        qtdFavoritos: 10,
        suites: [SuitesModel(nome: 'Suite 1')],
        qtdAvaliacoes: 50,
        media: 4.5,
      );

      expect(model.toJson(),
          '{"fantasia":"Test Motel","logo":"logo_url","bairro":"Test Neighborhood","distancia":5.0,"qtdFavoritos":10,"suites":[{"nome":"Suite 1","qtd":null,"exibirQtdDisponiveis":null,"fotos":null,"itens":null,"categoriaItens":null,"periodos":null}],"qtdAvaliacoes":50,"media":4.5}');
    });

    test('should create from JSON correctly', () {
      const jsonStr =
          '{"fantasia":"Test Motel","logo":"logo_url","bairro":"Test Neighborhood","distancia":5.0,"qtdFavoritos":10,"suites":[{"nome":"Suite 1"}],"qtdAvaliacoes":50,"media":4.5}';
      final model = MotelModel.fromJson(jsonStr);

      expect(model.fantasia, 'Test Motel');
      expect(model.logo, 'logo_url');
      expect(model.bairro, 'Test Neighborhood');
      expect(model.distancia, 5.0);
      expect(model.qtdFavoritos, 10);
      expect(model.suites?.first.nome, 'Suite 1');
      expect(model.qtdAvaliacoes, 50);
      expect(model.media, 4.5);
    });
  });
}
