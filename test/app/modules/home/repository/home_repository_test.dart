import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_gdm/app/core/core.dart';
import 'package:teste_gdm/app/modules/modules.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late MockHomeRepository repository;

  setUp(() {
    repository = MockHomeRepository();
  });

  group('HomeRepository Tests', () {
    test('Should return a list of motels on success', () async {
      final motels = [MotelModel(), MotelModel()];
      when(() => repository.getAllMotels()).thenAnswer((_) async => Right(motels));

      final result = await repository.getAllMotels();

      expect(result.isRight(), true);
      expect(result.fold((l) => null, (r) => r), motels);
    });

    test('Should return BadRequestError when the API responds with 400', () async {
      when(() => repository.getAllMotels()).thenAnswer((_) async => Left(BadRequestError('Invalid request')));

      final result = await repository.getAllMotels();

      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => null), isA<BadRequestError>());
    });

    test('Should return UnauthorizedError when the API responds with 401', () async {
      when(() => repository.getAllMotels()).thenAnswer((_) async => Left(UnauthorizedError('Unauthorized')));

      final result = await repository.getAllMotels();

      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => null), isA<UnauthorizedError>());
    });

    test('Should return InternalServerError when the API responds with 500', () async {
      when(() => repository.getAllMotels()).thenAnswer((_) async => Left(InternalServerError('Internal error')));

      final result = await repository.getAllMotels();

      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => null), isA<InternalServerError>());
    });

    test('Should return GenericFailure for unexpected errors', () async {
      when(() => repository.getAllMotels()).thenAnswer((_) async => Left(GenericFailure('Unknown error')));

      final result = await repository.getAllMotels();

      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => null), isA<GenericFailure>());
    });
  });
}
