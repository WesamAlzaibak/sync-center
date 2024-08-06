import 'package:json_annotation/json_annotation.dart';

enum PaymentType {
  @JsonValue("ORDER")
  order,
  @JsonValue("CHARGE")
  charge,
  @JsonValue("ACTIVITY")
  activity,
}