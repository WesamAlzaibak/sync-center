import 'package:json_annotation/json_annotation.dart';

part 'forget_password_credentials_dto.g.dart';

@JsonSerializable()
class ForgetPasswordCredentialsDto {
  @JsonKey(name: "email")
  final String email;

  ForgetPasswordCredentialsDto({
    required this.email,
  });

  factory ForgetPasswordCredentialsDto.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordCredentialsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordCredentialsDtoToJson(this);
}