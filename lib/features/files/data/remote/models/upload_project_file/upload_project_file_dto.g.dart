// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_project_file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadProjectFileDto _$UploadProjectFileDtoFromJson(Map<String, dynamic> json) =>
    UploadProjectFileDto(
      files: json['file'] as List<MultipartFile>,
    );

Map<String, dynamic> _$UploadProjectFileDtoToJson(UploadProjectFileDto instance) =>
    <String, dynamic>{
      'file': instance.files,
    };
