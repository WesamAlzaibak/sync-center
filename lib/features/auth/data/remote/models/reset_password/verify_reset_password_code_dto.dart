import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_password_code_dto.g.dart';

@JsonSerializable()
class VerifyResetPasswordCodeDto {
  @JsonKey(name: "otp")
  final String code;
  @JsonKey(name: "email")
  final String email;

  VerifyResetPasswordCodeDto({required this.code, required this.email});

  factory VerifyResetPasswordCodeDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetPasswordCodeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetPasswordCodeDtoToJson(this);
}
