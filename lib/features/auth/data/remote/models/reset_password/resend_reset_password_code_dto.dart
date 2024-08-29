import 'package:json_annotation/json_annotation.dart';

part 'resend_reset_password_code_dto.g.dart';

@JsonSerializable()
class ResendResetPasswordCodeDto {
  @JsonKey(name: "email")
  final String email;

  ResendResetPasswordCodeDto({
    required this.email,
  });

  factory ResendResetPasswordCodeDto.fromJson(Map<String, dynamic> json) =>
      _$ResendResetPasswordCodeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResendResetPasswordCodeDtoToJson(this);
}
