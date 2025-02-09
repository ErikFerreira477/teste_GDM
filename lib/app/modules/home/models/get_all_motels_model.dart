// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetAllMotelsModel {
  bool? sucesso;
  GetAllMotelsDataModel? data;
  List<String>? mensagem;

  GetAllMotelsModel({
    this.sucesso,
    this.data,
    this.mensagem,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sucesso': sucesso,
      'data': data?.toMap(),
      'mensagem': mensagem,
    };
  }

  factory GetAllMotelsModel.fromMap(Map<String, dynamic> map) {
    return GetAllMotelsModel(
      sucesso: map['sucesso'] != null ? map['sucesso'] as bool : null,
      data: map['data'] != null ? GetAllMotelsDataModel.fromMap(map['data'] as Map<String, dynamic>) : null,
      mensagem: map['mensagem'] != null ? List<String>.from((map['mensagem'])) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAllMotelsModel.fromJson(String source) =>
      GetAllMotelsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class GetAllMotelsDataModel {
  int? pagina;
  int? qtdPorPagina;
  int? totalSuites;
  int? totalMoteis;
  double? raio;
  double? maxPaginas;
  List<MotelModel>? moteis;

  GetAllMotelsDataModel({
    this.pagina,
    this.qtdPorPagina,
    this.totalSuites,
    this.totalMoteis,
    this.raio,
    this.maxPaginas,
    this.moteis,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pagina': pagina,
      'qtdPorPagina': qtdPorPagina,
      'totalSuites': totalSuites,
      'totalMoteis': totalMoteis,
      'raio': raio,
      'maxPaginas': maxPaginas,
      'moteis': moteis?.map((x) => x.toMap()).toList(),
    };
  }

  factory GetAllMotelsDataModel.fromMap(Map<String, dynamic> map) {
    return GetAllMotelsDataModel(
      pagina: map['pagina'] != null ? map['pagina'] as int : null,
      qtdPorPagina: map['qtdPorPagina'] != null ? map['qtdPorPagina'] as int : null,
      totalSuites: map['totalSuites'] != null ? map['totalSuites'] as int : null,
      totalMoteis: map['totalMoteis'] != null ? map['totalMoteis'] as int : null,
      raio: map['raio'] != null
          ? map['raio'] is int
              ? double.tryParse(map['raio'].toString())
              : map['raio'] as double
          : null,
      maxPaginas: map['maxPaginas'] != null ? map['maxPaginas'] as double : null,
      moteis: map['moteis'] != null
          ? List<MotelModel>.from(
              (map['moteis']).map<MotelModel?>((x) => MotelModel.fromMap(x as Map<String, dynamic>)),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAllMotelsDataModel.fromJson(String source) =>
      GetAllMotelsDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MotelModel {
  String? fantasia;
  String? logo;
  String? bairro;
  double? distancia;
  int? qtdFavoritos;
  List<SuitesModel>? suites;
  int? qtdAvaliacoes;
  double? media;

  MotelModel({
    this.fantasia,
    this.logo,
    this.bairro,
    this.distancia,
    this.qtdFavoritos,
    this.suites,
    this.qtdAvaliacoes,
    this.media,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fantasia': fantasia,
      'logo': logo,
      'bairro': bairro,
      'distancia': distancia,
      'qtdFavoritos': qtdFavoritos,
      'suites': suites?.map((x) => x.toMap()).toList(),
      'qtdAvaliacoes': qtdAvaliacoes,
      'media': media,
    };
  }

  factory MotelModel.fromMap(Map<String, dynamic> map) {
    return MotelModel(
      fantasia: map['fantasia'] != null ? map['fantasia'] as String : null,
      logo: map['logo'] != null ? map['logo'] as String : null,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
      distancia: map['distancia'] != null ? map['distancia'] as double : null,
      qtdFavoritos: map['qtdFavoritos'] != null ? map['qtdFavoritos'] as int : null,
      suites: map['suites'] != null
          ? List<SuitesModel>.from(
              (map['suites']).map<SuitesModel?>(
                (x) => SuitesModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      qtdAvaliacoes: map['qtdAvaliacoes'] != null ? map['qtdAvaliacoes'] as int : null,
      media: map['media'] != null ? map['media'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MotelModel.fromJson(String source) => MotelModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

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

class ItensModel {
  String? nome;

  ItensModel({
    this.nome,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
    };
  }

  factory ItensModel.fromMap(Map<String, dynamic> map) {
    return ItensModel(
      nome: map['nome'] != null ? map['nome'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItensModel.fromJson(String source) => ItensModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CategoriaItensModel {
  String? nome;
  String? icone;

  CategoriaItensModel({
    this.nome,
    this.icone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'icone': icone,
    };
  }

  factory CategoriaItensModel.fromMap(Map<String, dynamic> map) {
    return CategoriaItensModel(
      nome: map['nome'] != null ? map['nome'] as String : null,
      icone: map['icone'] != null ? map['icone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriaItensModel.fromJson(String source) =>
      CategoriaItensModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PeriodosModel {
  String? tempoFormatado;
  String? tempo;
  double? valor;
  double? valorTotal;
  bool? temCortesia;
  DescontoModel? desconto;

  PeriodosModel({
    this.tempoFormatado,
    this.tempo,
    this.valor,
    this.valorTotal,
    this.temCortesia,
    this.desconto,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tempoFormatado': tempoFormatado,
      'tempo': tempo,
      'valor': valor,
      'valorTotal': valorTotal,
      'temCortesia': temCortesia,
      'desconto': desconto?.toMap(),
    };
  }

  factory PeriodosModel.fromMap(Map<String, dynamic> map) {
    return PeriodosModel(
      tempoFormatado: map['tempoFormatado'] != null ? map['tempoFormatado'] as String : null,
      tempo: map['tempo'] != null ? map['tempo'] as String : null,
      valor: map['valor'] != null ? map['valor'] as double : null,
      valorTotal: map['valorTotal'] != null ? map['valorTotal'] as double : null,
      temCortesia: map['temCortesia'] != null ? map['temCortesia'] as bool : null,
      desconto: map['desconto'] != null ? DescontoModel.fromMap(map['desconto'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PeriodosModel.fromJson(String source) => PeriodosModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class DescontoModel {
  double? desconto;

  DescontoModel({
    this.desconto,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'desconto': desconto,
    };
  }

  factory DescontoModel.fromMap(Map<String, dynamic> map) {
    return DescontoModel(
      desconto: map['desconto'] != null ? map['desconto'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DescontoModel.fromJson(String source) => DescontoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
