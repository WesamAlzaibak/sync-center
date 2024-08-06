import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "verified")
  final bool verified;

  UserDto({
    required this.email,
    required this.name,
    required this.verified,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
