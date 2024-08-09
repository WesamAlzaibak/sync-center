import 'dart:ui';

import 'package:sync_center_mobile/core/ui/theme/colors.dart';

import '../../tasks/domain/enums/task_type.dart';

class TaskTypeUtils{
  static String taskTypeText(TaskType type){
    if(type==TaskType.toDo){
      return "To Do";
    }
    else if (type==TaskType.inProgress)
    {
      return "InProgress";
    }
    else if (type==TaskType.toReview)
    {
      return "To Check";
    }
    else
    {
      return "Done";
    }
  }



  static Color taskTypeColor(TaskType type){
    if(type==TaskType.toDo){
      return SyncColors.red.withOpacity(0.8);
    }
    else if (type==TaskType.inProgress)
    {
      return SyncColors.lightBlue.withOpacity(0.8);
    }
    else if (type==TaskType.toReview)
    {
      return SyncColors.lightBlue_1.withOpacity(0.8);
    }
    else
    {
      return SyncColors.green;
    }
  }
}