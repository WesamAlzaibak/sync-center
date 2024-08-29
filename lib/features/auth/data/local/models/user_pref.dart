import 'package:json_annotation/json_annotation.dart';

part 'user_pref.g.dart';

@JsonSerializable()
class UserPref {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "company_id")
  final int companyId;

  const UserPref({
   required this.name,
    required this.companyId,
  });

  factory UserPref.fromJson(Map<String, dynamic> json) =>
      _$UserPrefFromJson(json);

  Map<String, dynamic> toJson() => _$UserPrefToJson(this);
}
