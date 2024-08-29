import 'package:json_annotation/json_annotation.dart';

part 'pagination_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationResponse<T> {
  @JsonKey(name: "totalPages")
  final int totalPages;
  @JsonKey(name: "totalItems")
  final int totalItems;
  @JsonKey(name: "currentPage")
  final int currentPage;
  @JsonKey(name: "items")
  final List<T> items;

  PaginationResponse({
    required this.totalPages,
    required this.totalItems,
    required this.currentPage,
    required this.items
  });

  factory PaginationResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PaginationResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(T Function(Object?) fromJsonT) =>
      _$PaginationResponseToJson(this, fromJsonT);
}
