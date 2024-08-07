// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'normal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NormalResponse<T> _$NormalResponseFromJson<T>(Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,) =>
    NormalResponse<T>(
      success: json['success'] as bool,
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$NormalResponseToJson<T>(NormalResponse<T> instance,
    Object? Function(T value) toJsonT,) =>
    <String, dynamic>{
      'success': instance.success,
      'data': toJsonT(instance.data),
    };
