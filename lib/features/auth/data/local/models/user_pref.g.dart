// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_pref.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPref _$UserPrefFromJson(Map<String, dynamic> json) => UserPref(
      name: json["name"] as String,
      companyId: (json['company_id'] as num).toInt(),
    );

Map<String, dynamic> _$UserPrefToJson(UserPref instance) => <String, dynamic>{
      'name': instance.name,
      'company_id': instance.companyId,
    };
