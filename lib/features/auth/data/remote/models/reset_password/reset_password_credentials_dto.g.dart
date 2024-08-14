// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_credentials_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordCredentialsDto _$ResetPasswordCredentialsDtoFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordCredentialsDto(
      code: json['code'] as String,
          email: json['email'] as String,
      newPassword: json['new_password'] as String,
      confirmNewPassword: json['new_password_confirmation'] as String,
    );

Map<String, dynamic> _$ResetPasswordCredentialsDtoToJson(
        ResetPasswordCredentialsDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'email': instance.email,
      'new_password': instance.newPassword,
      'new_password_confirmation': instance.confirmNewPassword,
    };
