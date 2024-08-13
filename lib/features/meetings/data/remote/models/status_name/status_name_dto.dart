import 'package:json_annotation/json_annotation.dart';
import 'package:sync_center_mobile/features/meetings/domain/enums/status_name_enum.dart';

part 'status_name_dto.g.dart';

@JsonSerializable()
class StatusNameDto {
  @JsonKey(name: "status_name")
  final StatusNameEnum statusName;

  StatusNameDto({required this.statusName});

  factory StatusNameDto.fromJson(String json) =>
      StatusNameDto(
        statusName: $enumDecode(_$StatusNameEnumMap, json),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'status_name': _$StatusNameEnumMap[statusName]!,
  };
}