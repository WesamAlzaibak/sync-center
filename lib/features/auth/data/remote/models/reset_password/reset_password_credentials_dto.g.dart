// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_credentials_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordCredentialsDto _$ResetPasswordCredentialsDtoFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordCredentialsDto(
      code: json['token'] as String,
          email: json['email'] as String,
      newPassword: json['password'] as String,
      confirmNewPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$ResetPasswordCredentialsDtoToJson(
        ResetPasswordCredentialsDto instance) =>
    <String, dynamic>{
      'token': instance.code,
      'email': instance.email,
      'password': instance.newPassword,
      'confirmPassword': instance.confirmNewPassword,
    };
