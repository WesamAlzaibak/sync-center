import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/core/utils/server_exception.dart';

@injectable
class RemoteManager {
  final Dio _dio;

  const RemoteManager({
    required Dio dio,
  }) : _dio = dio;

  Future<Response<T>> request<T>(
      RequestMethod method,
      String url, {
        body,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      return await _dio.request(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          method: method.value,
          headers: headers,
        ),
      );
    } on DioException catch(e) {
        throw e.toServerException();
    } catch(e) {
      rethrow;
    }
  }
}

enum RequestMethod {
  get,
  head,
  post,
  put,
  delete,
  connect,
  options,
  trace,
  patch,
}

extension RequestMethodX on RequestMethod {
  String get value => name.toUpperCase();
}
