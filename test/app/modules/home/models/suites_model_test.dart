import 'package:flutter_test/flutter_test.dart';
import 'package:teste_gdm/app/modules/home/models/models.dart';

void main() {
  group('SuitesModel', () {
    test('should create an instance with given values', () {
      final model = SuitesModel(
        nome: 'Suite 1',
        qtd: 2,
        exibirQtdDisponiveis: true,
        fotos: ['photo1.jpg', 'photo2.jpg'],
        itens: [
          ItensModel(nome: 'Item 1'),
          ItensModel(nome: 'Item 2'),
        ],
        categoriaItens: [
          CategoriaItensModel(nome: 'Category 1'),
        ],
        periodos: [
          PeriodosModel(
            tempoFormatado: '1 hour',
            tempo: '1h',
            valor: 100.0,
            valorTotal: 90.0,
            temCortesia: true,
            desconto: DescontoModel(desconto: 10.0),
          ),
        ],
      );

      expect(model.nome, 'Suite 1');
      expect(model.qtd, 2);
      expect(model.exibirQtdDisponiveis, true);
      expect(model.fotos, ['photo1.jpg', 'photo2.jpg']);
      expect(model.itens?.length, 2);
      expect(model.itens?.first.nome, 'Item 1');
      expect(model.categoriaItens?.first.nome, 'Category 1');
      expect(model.periodos?.first.tempoFormatado, '1 hour');
    });

    test('should create an instance with null values', () {
      final model = SuitesModel();

      expect(model.nome, isNull);
      expect(model.qtd, isNull);
      expect(model.exibirQtdDisponiveis, isNull);
      expect(model.fotos, isNull);
      expect(model.itens, isNull);
      expect(model.categoriaItens, isNull);
      expect(model.periodos, isNull);
    });

    test('should convert to Map correctly', () {
      final model = SuitesModel(
        nome: 'Suite 1',
        qtd: 2,
        exibirQtdDisponiveis: true,
        fotos: ['photo1.jpg', 'photo2.jpg'],
        itens: [
          ItensModel(nome: 'Item 1'),
        ],
        categoriaItens: [
          CategoriaItensModel(nome: 'Category 1'),
        ],
        periodos: [
          PeriodosModel(
            tempoFormatado: '1 hour',
            tempo: '1h',
            valor: 100.0,
            valorTotal: 90.0,
            temCortesia: true,
            desconto: DescontoModel(desconto: 10.0),
          ),
        ],
      );

      expect(model.toMap(), {
        'nome': 'Suite 1',
        'qtd': 2,
        'exibirQtdDisponiveis': true,
        'fotos': ['photo1.jpg', 'photo2.jpg'],
        'itens': [
          {'nome': 'Item 1'}
        ],
        'categoriaItens': [
          {'nome': 'Category 1', 'icone': null}
        ],
        'periodos': [
          {
            'tempoFormatado': '1 hour',
            'tempo': '1h',
            'valor': 100.0,
            'valorTotal': 90.0,
            'temCortesia': true,
            'desconto': {'desconto': 10.0},
          }
        ],
      });
    });

    test('should create from Map correctly', () {
      final map = {
        'nome': 'Suite 1',
        'qtd': 2,
        'exibirQtdDisponiveis': true,
        'fotos': ['photo1.jpg', 'photo2.jpg'],
        'itens': [
          {'nome': 'Item 1'}
        ],
        'categoriaItens': [
          {'nome': 'Category 1'}
        ],
        'periodos': [
          {
            'tempoFormatado': '1 hour',
            'tempo': '1h',
            'valor': 100.0,
            'valorTotal': 90.0,
            'temCortesia': true,
            'desconto': {'desconto': 10.0},
          }
        ],
      };

      final model = SuitesModel.fromMap(map);

      expect(model.nome, 'Suite 1');
      expect(model.qtd, 2);
      expect(model.exibirQtdDisponiveis, true);
      expect(model.fotos, ['photo1.jpg', 'photo2.jpg']);
      expect(model.itens?.first.nome, 'Item 1');
      expect(model.categoriaItens?.first.nome, 'Category 1');
      expect(model.periodos?.first.tempoFormatado, '1 hour');
    });

    test('should convert to JSON correctly', () {
      final model = SuitesModel(
        nome: 'Suite 1',
        qtd: 2,
        exibirQtdDisponiveis: true,
        fotos: ['photo1.jpg', 'photo2.jpg'],
        itens: [
          ItensModel(nome: 'Item 1'),
        ],
        categoriaItens: [
          CategoriaItensModel(nome: 'Category 1'),
        ],
        periodos: [
          PeriodosModel(
            tempoFormatado: '1 hour',
            tempo: '1h',
            valor: 100.0,
            valorTotal: 90.0,
            temCortesia: true,
            desconto: DescontoModel(desconto: 10.0),
          ),
        ],
      );

      expect(model.toJson(),
          '{"nome":"Suite 1","qtd":2,"exibirQtdDisponiveis":true,"fotos":["photo1.jpg","photo2.jpg"],"itens":[{"nome":"Item 1"}],"categoriaItens":[{"nome":"Category 1","icone":null}],"periodos":[{"tempoFormatado":"1 hour","tempo":"1h","valor":100.0,"valorTotal":90.0,"temCortesia":true,"desconto":{"desconto":10.0}}]}');
    });

    test('should create from JSON correctly', () {
      const jsonStr =
          '{"nome":"Suite 1","qtd":2,"exibirQtdDisponiveis":true,"fotos":["photo1.jpg","photo2.jpg"],"itens":[{"nome":"Item 1"}],"categoriaItens":[{"nome":"Category 1"}],"periodos":[{"tempoFormatado":"1 hour","tempo":"1h","valor":100.0,"valorTotal":90.0,"temCortesia":true,"desconto":{"desconto":10.0}}]}';
      final model = SuitesModel.fromJson(jsonStr);

      expect(model.nome, 'Suite 1');
      expect(model.qtd, 2);
      expect(model.exibirQtdDisponiveis, true);
      expect(model.fotos, ['photo1.jpg', 'photo2.jpg']);
      expect(model.itens?.first.nome, 'Item 1');
      expect(model.categoriaItens?.first.nome, 'Category 1');
      expect(model.periodos?.first.tempoFormatado, '1 hour');
    });
  });
}
