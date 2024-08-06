import 'package:flutter/material.dart';
import 'package:sync_center_mobile/features/tasks/domain/entities/task.dart';

import '../../../../core/ui/theme/colors.dart';
import '../../../../core/utils/date.dart';
import 'package:intl/intl.dart';
import '../../../tasks/domain/enums/task_type.dart';

class TaskBottomSheetComponent extends StatelessWidget {
  const TaskBottomSheetComponent({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: SyncColors.grey,
                  child: Center(
                    child: Icon(
                      Icons.task_outlined,
                      size: 30,
                      color: task.type == TaskType.toDo
                          ? SyncColors.red
                          : task.type == TaskType.inProgress
                              ? SyncColors.lightBlue
                              : task.type == TaskType.toReview
                                  ? SyncColors.lightBlue_1
                                  : SyncColors.green,
                    ),
                  ),
                ),
                Text(
                  "task time : ${isToday(task.finishDate) ? "today" : DateFormat('dd/MM/yyyy').format(task.finishDate)}",
                  style: const TextStyle(
                    color: SyncColors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Task : ${task.title}",
              style: const TextStyle(
                color: SyncColors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Task Type: ",
                  style: TextStyle(
                    color: SyncColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  task.type == TaskType.toDo
                      ? "toDo"
                      : task.type == TaskType.inProgress
                          ? "inProgress"
                          : task.type == TaskType.toReview
                              ? "toReview"
                              : "Done",
                  style: TextStyle(
                    color: task.type == TaskType.toDo
                        ? SyncColors.red
                        : task.type == TaskType.inProgress
                            ? SyncColors.lightBlue
                            : task.type == TaskType.toReview
                                ? SyncColors.lightBlue_1
                                : SyncColors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "responsible employee: ",
                  style: TextStyle(
                    color: SyncColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: SyncColors.darkBlue.withOpacity(0.04)),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    task.employeeName,
                    style: const TextStyle(
                      color: SyncColors.darkBlue,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              task.description,
              style: const TextStyle(
                color: SyncColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
