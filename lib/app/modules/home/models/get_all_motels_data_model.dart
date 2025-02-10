import 'dart:convert';
import 'package:teste_gdm/app/modules/home/models/models.dart';

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
