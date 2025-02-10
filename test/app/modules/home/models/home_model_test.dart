import 'package:flutter_test/flutter_test.dart';
import 'package:teste_gdm/app/modules/home/models/models.dart';

void main() {
  group('HomeModel', () {
    test('should create an instance with given values', () {
      final model = HomeModel(
        isLoading: true,
        hasError: false,
        errorMessage: 'An error occurred',
        motels: [MotelModel()],
      );

      expect(model.isLoading, true);
      expect(model.hasError, false);
      expect(model.errorMessage, 'An error occurred');
      expect(model.motels, isNotEmpty);
    });

    test('should create an instance with default values', () {
      final model = HomeModel(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        motels: [],
      );

      expect(model.isLoading, false);
      expect(model.hasError, false);
      expect(model.errorMessage, '');
      expect(model.motels, isEmpty);
    });
  });
}
