import 'package:json_annotation/json_annotation.dart';

part 'normal_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NormalResponse<T> {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "data")
  final T data;

  NormalResponse({required this.success, required this.data});

  factory NormalResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$NormalResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(T Function(Object?) fromJsonT) =>
      _$NormalResponseToJson(this, fromJsonT);
}
