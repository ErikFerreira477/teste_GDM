import 'dart:convert';

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
