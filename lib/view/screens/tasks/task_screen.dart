import 'package:flutter/material.dart';
import 'package:flutter_113/view/components/widgets/model_bottom_sheet.dart';
import 'package:flutter_113/view/components/widgets/text_form_field_custom.dart';
import 'package:flutter_113/view_model/cubit/tasks_cubit/tasks_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/widgets/tab_bar.dart';
import 'add_task.dart';
import 'all_tasks.dart';
import 'archived_tasks.dart';
import 'done_tasks.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: TasksCubit.get(context)..getTasksFireStore(),
      child: Scaffold(
        body: const SafeArea(
          child: TabBarCustom(
            tabs: [
              Tab(
                text: 'Tasks',
              ),
              Tab(
                text: 'Done',
              ),
              Tab(
                text: 'Archived',
              ),
            ],
            children: [
              AllTasks(),
              DoneTasks(),
              ArchivedTasks(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            openBottomSheet(
              context,
              const AddTask(),
            );
          },
          shape: const CircleBorder(),
          backgroundColor: Colors.red,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
