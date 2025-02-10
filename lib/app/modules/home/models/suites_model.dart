import 'dart:convert';
import 'package:teste_gdm/app/modules/home/models/models.dart';

class SuitesModel {
  String? nome;
  int? qtd;
  bool? exibirQtdDisponiveis;
  List<String>? fotos;
  List<ItensModel>? itens;
  List<CategoriaItensModel>? categoriaItens;
  List<PeriodosModel>? periodos;

  SuitesModel({
    this.nome,
    this.qtd,
    this.exibirQtdDisponiveis,
    this.fotos,
    this.itens,
    this.categoriaItens,
    this.periodos,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'qtd': qtd,
      'exibirQtdDisponiveis': exibirQtdDisponiveis,
      'fotos': fotos,
      'itens': itens?.map((x) => x.toMap()).toList(),
      'categoriaItens': categoriaItens?.map((x) => x.toMap()).toList(),
      'periodos': periodos?.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  factory SuitesModel.fromJson(String source) => SuitesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory SuitesModel.fromMap(Map<String, dynamic> map) {
    return SuitesModel(
      nome: map['nome'] != null ? map['nome'] as String : null,
      qtd: map['qtd'] != null ? map['qtd'] as int : null,
      exibirQtdDisponiveis: map['exibirQtdDisponiveis'] != null ? map['exibirQtdDisponiveis'] as bool : null,
      fotos: map['fotos'] != null ? List<String>.from((map['fotos'])) : null,
      itens: map['itens'] != null
          ? List<ItensModel>.from(
              (map['itens']).map<ItensModel?>(
                (x) => ItensModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      categoriaItens: map['categoriaItens'] != null
          ? List<CategoriaItensModel>.from(
              (map['categoriaItens']).map<CategoriaItensModel?>(
                (x) => CategoriaItensModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      periodos: map['periodos'] != null
          ? List<PeriodosModel>.from(
              (map['periodos']).map<PeriodosModel?>(
                (x) => PeriodosModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}
