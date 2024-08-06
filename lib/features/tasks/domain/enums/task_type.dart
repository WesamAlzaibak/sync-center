import 'package:json_annotation/json_annotation.dart';

enum TaskType {
  @JsonValue("ALL")
  all,
  @JsonValue("TODO")
  toDo,
  @JsonValue("ToProgress")
  inProgress,
  @JsonValue("ToReview")
  toReview,
  @JsonValue("Done")
  done,
}

extension TaskTypeX on TaskType {
  String get localizationKey {
    switch (this) {
      case TaskType.all:
        return "ALL";
      case TaskType.toDo:
        return "TODO";
      case TaskType.inProgress:
        return "ToProgress";
      case TaskType.toReview:
        return "ToReview";
      case TaskType.done:
        return "Done";
    }
  }
}
