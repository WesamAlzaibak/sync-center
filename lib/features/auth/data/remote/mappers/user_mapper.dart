import '../../../domain/models/user.dart';
import '../../local/models/user_pref.dart';
import '../models/user/user_dto.dart';
import '../models/user/user_system_entries_dto.dart';

extension UserSystemEntiresDtoX on UserSystemEntriesDto {
  User toUser() => User(
        name: userDto.name,
        token: token,
      );
}

extension UserDtoX on UserDto {
  User toUser() => User(
        name: name,
        token: "",
      );
}

extension UserX on User {
  UserPref toUserPref() => UserPref(name: name);
}
