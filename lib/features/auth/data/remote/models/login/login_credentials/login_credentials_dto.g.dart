// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_credentials_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginCredentialsDto _$LoginCredentialsDtoFromJson(Map<String, dynamic> json) =>
    LoginCredentialsDto(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginCredentialsDtoToJson(
        LoginCredentialsDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
