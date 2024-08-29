import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AuthPreferences {
  final SharedPreferences _sharedPreferences;

  AuthPreferences({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  bool isLoggedIn() => _sharedPreferences.getBool("isLoggedIn") ?? false;

  bool isVerified() => _sharedPreferences.getBool("isVerified") ?? false;

  Future<void> setLoggedIn() async =>
      await _sharedPreferences.setBool("isLoggedIn", true);

  Future<void> setLoggedOut() async =>
      await _sharedPreferences.setBool("isLoggedIn", false);

  Future<void> setVerified(bool verified) async =>
      await _sharedPreferences.setBool("isVerified", verified);

  String? getToken() => _sharedPreferences.getString("token");

  Future<void> setToken(String token) async =>
      await _sharedPreferences.setString("token", token);
}
