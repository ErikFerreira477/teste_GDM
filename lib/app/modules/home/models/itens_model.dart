import 'dart:convert';

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
