import 'dart:convert';
import 'package:teste_gdm/app/modules/home/models/models.dart';

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
