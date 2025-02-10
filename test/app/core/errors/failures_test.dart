import 'package:flutter_test/flutter_test.dart';
import 'package:teste_gdm/app/core/errors/errors.dart';

void main() {
  group('Failure Classes', () {
    test('GenericFailure should store the message', () {
      final failure = GenericFailure('A generic error occurred');

      expect(failure.message, 'A generic error occurred');
    });

    test('GenericFailure should handle null message', () {
      final failure = GenericFailure(null);

      expect(failure.message, isNull);
    });

    test('UnauthorizedError should store the message', () {
      final failure = UnauthorizedError('Unauthorized access');

      expect(failure.message, 'Unauthorized access');
    });

    test('UnauthorizedError should handle null message', () {
      final failure = UnauthorizedError(null);

      expect(failure.message, isNull);
    });

    test('InternalServerError should store the message', () {
      final failure = InternalServerError('Internal server error');

      expect(failure.message, 'Internal server error');
    });

    test('InternalServerError should handle null message', () {
      final failure = InternalServerError(null);

      expect(failure.message, isNull);
    });

    test('BadRequestError should store the message', () {
      final failure = BadRequestError('Bad request');

      expect(failure.message, 'Bad request');
    });

    test('BadRequestError should handle null message', () {
      final failure = BadRequestError(null);

      expect(failure.message, isNull);
    });
  });

  group('RestClientException', () {
    test('RestClientException should store properties correctly', () {
      final exception = RestClientException(
        message: 'An error occurred',
        statusCode: 500,
        error: 'Internal server error',
      );

      expect(exception.message, 'An error occurred');
      expect(exception.statusCode, 500);
      expect(exception.error, 'Internal server error');
    });

    test('RestClientException should handle null properties', () {
      final exception = RestClientException(
        message: null,
        statusCode: null,
        error: null,
      );

      expect(exception.message, isNull);
      expect(exception.statusCode, isNull);
      expect(exception.error, isNull);
    });

    test('RestClientException should return the correct string representation', () {
      final exception = RestClientException(
        message: 'Not Found',
        statusCode: 404,
        error: 'Page not found',
      );

      expect(exception.toString(), 'RestClientException(message: Not Found, statusCode: 404, error: Page not found)');
    });
  });
}
