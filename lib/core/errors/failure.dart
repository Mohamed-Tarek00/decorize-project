import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
  @override
  String toString() => errorMessage;
}

class ServiceFailure extends Failure {
  ServiceFailure(super.errorMessage);
  factory ServiceFailure.fromDio(DioException dioerror) {
    switch (dioerror.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailure('Connection timeout with Api server');
      case DioExceptionType.sendTimeout:
        return ServiceFailure('Send timeout with Api server');
      case DioExceptionType.receiveTimeout:
        return ServiceFailure('Send timeout with Api server');

      case DioExceptionType.badCertificate:
        return ServiceFailure(
          'Could not establish a secure connection to the server.',
        );
      case DioExceptionType.badResponse:
        return ServiceFailure(
          'The server responded with an invalid status: ${dioerror.response?.statusCode ?? 'Unknown'}',
        );

      case DioExceptionType.cancel:
        return ServiceFailure('Request was cancelled. Please try again.');

      case DioExceptionType.connectionError:
        return ServiceFailure(
          'Could not connect to the server. Check your internet connection.',
        );

      case DioExceptionType.unknown:
        return ServiceFailure(
          'An unexpected error occurred. Please try again later.',
        );
    }
  }
}
