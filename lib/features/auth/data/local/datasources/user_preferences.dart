import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_pref.dart';

@injectable
class UserPreferences {
  final SharedPreferences _sharedPreferences;

  UserPreferences({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  UserPref getUser() => UserPref.fromJson(
      jsonDecode(_sharedPreferences.getString("userPref") ?? ""));

  Future<void> setUser(UserPref userPref) async => await _sharedPreferences
      .setString("userPref", jsonEncode(userPref.toJson()));
}
