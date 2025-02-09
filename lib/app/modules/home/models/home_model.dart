import 'package:teste_gdm/app/modules/home/models/models.dart';

class HomeModel {
  bool isLoading;
  bool hasError;
  String errorMessage;
  List<MotelModel> motels;

  HomeModel({
    required this.isLoading,
    required this.hasError,
    required this.errorMessage,
    required this.motels,
  });
}
