import 'package:json_annotation/json_annotation.dart';

part 'profile_dto.g.dart';

@JsonSerializable()
class ProfileDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "created_at")
  final String createdDate;
  @JsonKey(name: "image", defaultValue: "")
  final String image;

  ProfileDto({
    required this.name,
    required this.id,
    required this.email,
    required this.image,
    required this.createdDate
  });

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);
}
