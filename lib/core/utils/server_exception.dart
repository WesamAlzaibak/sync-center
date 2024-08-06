import 'package:dio/dio.dart';

class ServerException implements Exception {
  final int statusCode;
  final String message;
  final List<String> details;

  ServerException(
      {required this.message,
      required this.details,
      required this.statusCode});

  @override
  String toString() => message;
}

extension DioExceptionX on DioException {
  ServerException toServerException() {
    final statusCode = response?.statusCode ?? 0;
    final message = response?.data['errors'][0];
    return ServerException(
        statusCode: statusCode,
        message: (message ?? "Unknown Error") as String,
        details: List.empty()
    );
  }
}
