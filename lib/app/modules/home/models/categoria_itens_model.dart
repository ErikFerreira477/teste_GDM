import 'dart:convert';

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
