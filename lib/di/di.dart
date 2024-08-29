import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/data/remote/api_routes.dart';
import '../core/ui/navigation/navigation.dart';
import '../features/auth/data/local/datasources/auth_preferences.dart';
import '../features/auth/data/local/repositories/auth_local_repository.dart';
import '../features/auth/ui/screens/login_screen.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

@module
abstract class DioModule {
  @singleton
  Dio get dio {
    final dio = Dio();
    final options = BaseOptions(
      baseUrl: ApiRoutes.devApi,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {
        "x-locale": "ar"
      }
    );
    dio.options = options;
    dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await _getTokenFromSharedPreferences();
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onError: (exception, handler) async {
          if(exception.response?.statusCode == 401) {
            await getIt.get<AuthLocalRepository>().setLoggedOut();
            router.go(LoginScreen.route);
          }
          return handler.next(exception);
        }
      ),
    );

    return dio;
  }
}

Future<String?> _getTokenFromSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return AuthPreferences(sharedPreferences: prefs).getToken();
}

@module
abstract class SharedPreferencesModule {
  @preResolve
  Future<SharedPreferences> get pref => SharedPreferences.getInstance();
}
