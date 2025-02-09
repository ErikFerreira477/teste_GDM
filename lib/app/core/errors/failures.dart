// ignore_for_file: overridden_fields, annotate_overrides

abstract class Failure {
  String? message;

  Failure({this.message});
}

class GenericFailure extends Failure {
  final String? message;

  GenericFailure(this.message);
}

class UnauthorizedError extends Failure {
  final String? message;

  UnauthorizedError(this.message);
}

class InternalServerError extends Failure {
  final String? message;

  InternalServerError(this.message);
}

class BadRequestError extends Failure {
  final String? message;

  BadRequestError(this.message);
}

class RestClientException implements Exception {
  String? message;
  int? statusCode;
  dynamic error;

  RestClientException({
    this.message,
    this.statusCode,
    required this.error,
  });

  @override
  String toString() {
    return 'RestClientException(message: $message, statusCode: $statusCode, error: $error)';
  }
}
