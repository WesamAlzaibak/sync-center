import 'package:json_annotation/json_annotation.dart';

enum StatusNameEnum {
  @JsonValue("PENDING")
  pending,
  @JsonValue("REJECTED")
  rejected,
  @JsonValue("ACCEPTED")
  accepted,
}