import 'package:flutter/material.dart';
import 'package:flutter_113/model/task.dart';
import 'package:flutter_113/model/task/task_model.dart' as task;
import 'package:flutter_113/view/screens/tasks/components/task_widget.dart';
import 'package:flutter_113/view_model/cubit/tasks_cubit/tasks_cubit.dart';
import 'package:flutter_113/view_model/enums/tasks_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoneTasks extends StatelessWidget {
  const DoneTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        var cubit = TasksCubit.get(context);
        List<Task> list = cubit.tasksList.where((element) => element.status == TasksType.done).toList();
        return Visibility(
          visible: list.isNotEmpty,
          replacement: Center(
            child: Text('No Done Tasks'),
          ),
          child: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              return TaskWidget(
                task: task.Task(),
              );
            },
            separatorBuilder: (context, index) =>
            const SizedBox(
              height: 12,
            ),
            itemCount: list.length,
          ),
        );
      },
    );
  }
}
