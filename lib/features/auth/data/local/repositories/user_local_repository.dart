import 'package:injectable/injectable.dart';

import '../datasources/user_preferences.dart';
import '../models/user_pref.dart';

@injectable
class UserLocalRepository {
  final UserPreferences _userPreferences;

  UserLocalRepository({required UserPreferences userPreferences})
      : _userPreferences = userPreferences;

  UserPref getUser() => _userPreferences.getUser();

  Future<void> setUser(UserPref userPref) async => _userPreferences.setUser(userPref);
}
