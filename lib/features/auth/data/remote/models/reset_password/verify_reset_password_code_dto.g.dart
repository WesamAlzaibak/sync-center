// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_reset_password_code_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResetPasswordCodeDto _$VerifyResetPasswordCodeDtoFromJson(
        Map<String, dynamic> json) =>
    VerifyResetPasswordCodeDto(
      code: json['otp'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$VerifyResetPasswordCodeDtoToJson(
        VerifyResetPasswordCodeDto instance) =>
    <String, dynamic>{
      'otp': instance.code,
      'email': instance.email,
    };
