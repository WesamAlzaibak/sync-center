import 'package:json_annotation/json_annotation.dart';

part 'login_credentials_dto.g.dart';

@JsonSerializable()
class LoginCredentialsDto {
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "password")
  final String password;

  LoginCredentialsDto({required this.email, required this.password});

  factory LoginCredentialsDto.fromJson(Map<String, dynamic> json) =>
      _$LoginCredentialsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginCredentialsDtoToJson(this);
}
