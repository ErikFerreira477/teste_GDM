// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:teste_gdm/app/modules/home/models/models.dart';

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
