import 'package:flutter/material.dart';
import 'package:flutter_113/view_model/cubit/tasks_cubit/tasks_cubit.dart';
import 'package:flutter_113/view_model/enums/tasks_type.dart';
import '../../../../model/task/task_model.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  final void Function()? onTap;

  const TaskWidget({required this.task, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.red,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(
              task.description ?? '',
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    task.startDate ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Visibility(
                  visible: task.status == TasksType.all || task.status == TasksType.archived,
                  child: IconButton(
                    onPressed: () {
                      TasksCubit.get(context).changeTaskType(task.id ?? 0, TasksType.done);
                    },
                    icon: const Icon(
                      Icons.done_all,
                      color: Colors.green,
                    ),
                  ),
                ),
                if (task.status == TasksType.done)
                  IconButton(
                    onPressed: () {
                      TasksCubit.get(context).changeTaskType(task.id ?? 0, TasksType.archived);
                    },
                    icon: const Icon(
                      Icons.archive_outlined,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
