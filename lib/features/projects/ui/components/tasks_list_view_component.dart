import 'package:flutter/material.dart';
import 'package:sync_center_mobile/core/ui/theme/colors.dart';

import '../../../tasks/domain/entities/task.dart';
import '../../../tasks/domain/enums/task_type.dart';

class TasksGridView extends StatelessWidget {
  final List<Task> tasks;
  final void Function(int) onTaskClicked;
  final TaskType type;
  final bool isLoading;

  const TasksGridView({
    super.key,
    required this.tasks,
    required this.onTaskClicked,
    required this.type,
    required this.isLoading,
  });

  bool shouldDisplayTask(Task task) {
    return task.type==type||type==TaskType.all;
  }

  @override
  Widget build(BuildContext context) {
    final tasksFiltered =
    tasks.where((element) => shouldDisplayTask(element)).toList();
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        childAspectRatio: 1.25,
        mainAxisSpacing: 8,
      ),
      itemCount: isLoading ? 4 : tasksFiltered.length,
      itemBuilder: (context, index) {
        return _TaskItem(
          onClick: () => isLoading ? null : onTaskClicked(tasksFiltered[index].id),
          title: tasksFiltered[index].title,
          type: tasksFiltered[index].type,
          isLoading: isLoading,
        );
      },
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem({
    required this.title,
    required this.type,
    required this.onClick,
    required this.isLoading,
  });

  final String title;
  final TaskType type;
  final bool isLoading;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onClick,
          borderRadius: BorderRadius.circular(8),
          child: Column(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: isLoading
                      ? Colors.grey
                      : type == TaskType.toDo
                          ? SyncColors.red.withOpacity(0.8)
                          : type == TaskType.inProgress
                              ? SyncColors.lightBlue.withOpacity(0.8)
                              : type == TaskType.toReview
                                  ? SyncColors.lightBlue_1.withOpacity(0.8)
                                  : SyncColors.green,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: SyncColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
