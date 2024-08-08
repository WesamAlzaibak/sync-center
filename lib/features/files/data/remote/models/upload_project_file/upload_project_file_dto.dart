import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_project_file_dto.g.dart';

class UploadProjectFileDto {
  @JsonKey(name: "file")
  final List<MultipartFile> files;

  UploadProjectFileDto({
    required this.files,
  });

  Map<String, dynamic> toJson() => {
    'file': files,
  };

  static Future<UploadProjectFileDto> fromFilePickerResult(FilePickerResult result) async {
    List<MultipartFile> files = [];
    for (var file in result.files) {
      files.add(await MultipartFile.fromFile(file.path!, filename: file.name));
    }
    return UploadProjectFileDto(files: files);
  }
}