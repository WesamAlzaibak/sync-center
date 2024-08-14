import 'package:json_annotation/json_annotation.dart';

part 'reset_password_credentials_dto.g.dart';

@JsonSerializable()
class ResetPasswordCredentialsDto {
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "new_password")
  final String newPassword;
  @JsonKey(name: "new_password_confirmation")
  final String confirmNewPassword;

  ResetPasswordCredentialsDto({
    required this.code,
    required this.email,
    required this.newPassword,
    required this.confirmNewPassword
  });

  factory ResetPasswordCredentialsDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordCredentialsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordCredentialsDtoToJson(this);
}
