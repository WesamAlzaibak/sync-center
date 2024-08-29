import 'package:json_annotation/json_annotation.dart';

enum TaskType {
  @JsonValue("ALL")
  all,
  @JsonValue("To Do")
  toDo,
  @JsonValue("Doing")
  inProgress,
  @JsonValue("To Check")
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
        return "To Do";
      case TaskType.inProgress:
        return "Doing";
      case TaskType.toReview:
        return "To Check";
      case TaskType.done:
        return "Done";
    }
  }
}
