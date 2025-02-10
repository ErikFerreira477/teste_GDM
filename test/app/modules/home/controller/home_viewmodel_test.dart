import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_gdm/app/modules/modules.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late HomeViewModel homeViewModel;
  late MockHomeRepository mockHomeRepository;

  setUpAll(() {
    mockHomeRepository = MockHomeRepository();
    homeViewModel = HomeViewModel();
  });

  test('isLoading should return correct value', () {
    expect(homeViewModel.isLoading, false);
  });

  test('hasError should return correct value', () {
    expect(homeViewModel.hasError, false);
  });

  test('errorMessage should return correct value', () {
    expect(homeViewModel.errorMessage, '');
  });

  test('motels should return correct value', () {
    expect(homeViewModel.motels, <MotelModel>[]);
  });

  test('changeIsLoading should update isLoading', () {
    homeViewModel.changeIsLoading(value: true);
    expect(homeViewModel.isLoading, true);
  });

  test('changeMotels should update motels', () {
    final mockMotels = [MotelModel()];
    homeViewModel.changeMotels(motels: mockMotels);
    expect(homeViewModel.motels, mockMotels);
  });

  test('changeHasError should update hasError', () {
    homeViewModel.changeHasError(value: true);
    expect(homeViewModel.hasError, true);
  });

  test('changeErrorMessage should update errorMessage', () {
    const errorMessage = 'An error occurred';
    homeViewModel.changeErrorMessage(message: errorMessage);
    expect(homeViewModel.errorMessage, errorMessage);
  });

  test('getAllMotels should update motels and isLoading', () async {
    final mockMotels = [MotelModel()];
    when(() => mockHomeRepository.getAllMotels()).thenAnswer(
      (_) async => Right(mockMotels),
    );

    await homeViewModel.getAllMotels();

    expect(homeViewModel.motels, isNotEmpty);
    expect(homeViewModel.isLoading, false);
  });
}
