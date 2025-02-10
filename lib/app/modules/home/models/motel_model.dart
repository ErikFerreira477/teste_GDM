import 'dart:convert';
import 'package:teste_gdm/app/modules/home/models/models.dart';

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
