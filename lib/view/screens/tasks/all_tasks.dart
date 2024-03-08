import 'package:flutter/material.dart';
import 'package:flutter_113/view/components/widgets/model_bottom_sheet.dart';
import 'package:flutter_113/view/components/widgets/text_custom.dart';
import 'package:flutter_113/view/screens/auth/login_screen.dart';
import 'package:flutter_113/view/screens/tasks/add_task.dart';
import 'package:flutter_113/view/screens/tasks/components/task_widget.dart';
import 'package:flutter_113/view_model/cubit/tasks_cubit/tasks_cubit.dart';
import 'package:flutter_113/view_model/data/local/shared_helper.dart';
import 'package:flutter_113/view_model/data/local/shared_keys.dart';
import 'package:flutter_113/view_model/utils/navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/task/task_model.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TasksCubit.get(context).initListener();
    return BlocConsumer<TasksCubit, TasksState>(
      listener: (context, state) {
        // if (state is TokenExpired) {
        //   Navigation.pushAndReplace(
        //     context,
        //     LoginScreen(),
        //   );
        //   SharedHelper.remove(key: SharedKeys.token);
        // }
      },
      builder: (context, state) {
        var cubit = TasksCubit.get(context);
        // List<Task> list = cubit.tasksList.where((element) => element.status == TasksType.all).toList();
        return Column(
          children: [
            Expanded(
              child: Visibility(
                visible: (cubit.fireStoreTasks).isNotEmpty,
                replacement: const Center(
                  child: Text('No Tasks'),
                ),
                child: ListView.separated(
                  controller: cubit.scrollController,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return TaskWidget(
                      task: cubit.fireStoreTasks?[index] ?? Task(),
                      onTap: () {
                        openBottomSheet(
                          context,
                          AddTask(
                            task: cubit.fireStoreTasks?[index] ?? Task(),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                  itemCount: cubit.fireStoreTasks?.length ?? 0,
                ),
              ),
            ),
            if (state is GetMoreTasksLoadingState) const CircularProgressIndicator.adaptive(),
            if ((cubit.taskModel?.data?.meta?.currentPage ?? 0) == (cubit.taskModel?.data?.meta?.lastPage ?? 0))
              const TextCustom(
                text: 'No More Data to Load',
              ),
          ],
        );
      },
    );
  }
}

// Learn 2 Last Lectures.
// News App with API.
// Pokemon App with API.
// Todo App (Login - Register - Get All Tasks - Add Task - Edit Task - Delete Task).

// MVVM Model - View - View_model

// Pagination - Upload any File to Server
