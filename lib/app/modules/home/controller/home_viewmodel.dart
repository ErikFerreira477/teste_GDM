import 'package:flutter/material.dart';
import 'package:teste_gdm/app/modules/home/models/models.dart';
import 'package:teste_gdm/app/modules/home/repository/repository.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepository = HomeRepository();
  final HomeModel _homeModel = HomeModel(
    isLoading: false,
    hasError: false,
    errorMessage: '',
    motels: <MotelModel>[],
  );

  bool get isLoading => _homeModel.isLoading;
  bool get hasError => _homeModel.hasError;
  String get errorMessage => _homeModel.errorMessage;
  List<MotelModel> get motels => _homeModel.motels;

  void changeMotels({required List<MotelModel> motels}) => _homeModel.motels = motels;
  void changeHasError({required bool value}) => _homeModel.hasError = value;
  void changeErrorMessage({required String message}) => _homeModel.errorMessage = message;
  void changeIsLoading({required bool value}) {
    _homeModel.isLoading = value;
    notifyListeners();
  }

  Future<void> getAllMotels() async {
    changeIsLoading(value: true);

    final result = await _homeRepository.getAllMotels();

    result.fold(
      (l) {
        _homeModel.hasError = true;
        _homeModel.errorMessage = l.message ?? "";
      },
      (r) {
        _homeModel.motels = r;
      },
    );

    changeIsLoading(value: false);
  }
}
