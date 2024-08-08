import 'package:json_annotation/json_annotation.dart';
import 'package:sync_center_mobile/features/auth/data/remote/models/user/user_dto.dart';

part 'user_system_entries_dto.g.dart';

@JsonSerializable()
class UserSystemEntriesDto {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "access_token")
  final String token;

  UserSystemEntriesDto({required this.name, required this.token});

  factory UserSystemEntriesDto.fromJson(Map<String, dynamic> json) =>
      _$UserSystemEntriesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserSystemEntriesDtoToJson(this);
}