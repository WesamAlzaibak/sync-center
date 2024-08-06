import 'package:injectable/injectable.dart';

import '../datasources/auth_preferences.dart';

@injectable
class AuthLocalRepository {
  final AuthPreferences _authPreferences;

  AuthLocalRepository({required AuthPreferences authPreferences})
      : _authPreferences = authPreferences;

  bool isLoggedIn() => _authPreferences.isLoggedIn();

  Future<void> setLoggedIn() async => await _authPreferences.setLoggedIn();

  Future<void> setLoggedOut() async => await _authPreferences.setLoggedOut();

  String? getToken() => _authPreferences.getToken();

  Future<void> setToken(String token) async =>
      await _authPreferences.setToken(token);
}
