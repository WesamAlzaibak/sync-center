import 'package:flutter/material.dart';

import '../../../../core/ui/theme/colors.dart';

class TasksComponent extends StatelessWidget {
  const TasksComponent(
      {super.key,
      required this.toDo,
      required this.doing,
      required this.reviewing,
      required this.done,
      required this.onClick});

  final int toDo;
  final int doing;
  final int reviewing;
  final int done;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onClick,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(spreadRadius: 16,blurStyle: BlurStyle.inner,offset: const Offset(0, 4),blurRadius: 0,color: Colors.grey[100]!.withOpacity(0.4),)]
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TasksItemsComponent(
                          tasksTitle: 'To Do',
                          tasksNumber: '$toDo',
                          taskColor: SyncColors.black,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TasksItemsComponent(
                          tasksTitle: 'Doing',
                          tasksNumber: '$doing',
                          taskColor: SyncColors.red,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        TasksItemsComponent(
                          tasksTitle: 'ToReview',
                          tasksNumber: '$reviewing',
                          taskColor: SyncColors.darkBlue,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TasksItemsComponent(
                          tasksTitle: 'Done',
                          tasksNumber: '$done',
                          taskColor: SyncColors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),),);
  }
}

class TasksItemsComponent extends StatelessWidget {
  const TasksItemsComponent(
      {super.key,
      required this.tasksTitle,
      required this.tasksNumber,
      required this.taskColor,});

  final String tasksTitle;
  final String tasksNumber;
  final Color taskColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.grey[100]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  tasksTitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: taskColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                tasksNumber,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: SyncColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
