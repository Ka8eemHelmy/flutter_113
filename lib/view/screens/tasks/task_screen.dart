import 'package:flutter/material.dart';

import '../../components/widgets/tab_bar.dart';
import 'all_tasks.dart';
import 'archived_tasks.dart';
import 'done_tasks.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
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
    );
  }
}
