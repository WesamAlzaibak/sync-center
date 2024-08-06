// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'normal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NormalResponse<T> _$NormalResponseFromJson<T>(Map<String, dynamic> json,String objectType,
    T Function(Object? json) fromJsonT,) =>
    NormalResponse<T>(
      success: json['success'] as bool,
      data: fromJsonT(json[objectType]),
    );

Map<String, dynamic> _$NormalResponseToJson<T>(NormalResponse<T> instance,String objectType,
    Object? Function(T value) toJsonT,) =>
    <String, dynamic>{
      'success': instance.success,
      objectType: toJsonT(instance.data),
    };
