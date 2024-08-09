import 'package:flutter/material.dart';
import 'package:sync_center_mobile/features/tasks/domain/entities/task.dart';

import '../../../../core/ui/reusables/images/sync_network_image.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../../core/utils/date.dart';
import 'package:intl/intl.dart';
import '../../../tasks/domain/enums/task_type.dart';
import '../../utils/task_type_utils.dart';

class TaskBottomSheetComponent extends StatelessWidget {
  const TaskBottomSheetComponent({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final startDate = DateTime.parse(task.startDate);
    final endDate = DateTime.parse(task.endDate);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
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
                  "Time Duration: ${task.totalDuration}",
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
                 TaskTypeUtils.taskTypeText(task.type),
                  style: TextStyle(
                    color: TaskTypeUtils.taskTypeColor(task.type),
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
        Text(
          "task time: from ${isToday(startDate) ? "today" : DateFormat('dd/MM/yyyy').format(startDate)} - ${isToday(endDate) ? "today" : DateFormat('dd/MM/yyyy').format(endDate)}",
          style: const TextStyle(
            color: SyncColors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
            const SizedBox(
              height: 20,
            ),
                const Text(
                  "responsible employees: ",
                  style: TextStyle(
                    color: SyncColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
            const SizedBox(
              height: 10,
            ),
            ListView.separated(
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: SyncColors.darkBlue.withOpacity(0.04)),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: task.employees[index].image==""?Center(
                        child: Text(
                          task.employees[index].name[0].toUpperCase(),
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: SyncColors.darkBlue,
                          ),
                        ),
                      ):ClipOval(
                        child: SyncNetworkImage(
                          imageUrl: task.employees[index].image,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      task.employees[0].name,
                      style: const TextStyle(
                        color: SyncColors.darkBlue,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: task.employees.length,
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
