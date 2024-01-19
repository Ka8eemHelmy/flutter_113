import 'package:bloc/bloc.dart';
import 'package:flutter_113/view_model/enums/tasks_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/task.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  static TasksCubit get(context) => BlocProvider.of<TasksCubit>(context);

  List<Task> tasksList = [
    Task(
      id: 1,
      title: 'Task 1',
      description: 'Description 1',
      date: '01/01/2021',
      status: TasksType.all,
    ),
    Task(
      id: 2,
      title: 'Task 2',
      description: 'Description 2',
      date: '01/01/2021',
      status: TasksType.done,
    ),
    Task(
      id: 3,
      title: 'Task 3',
      description: 'Description 3',
      date: '01/01/2021',
      status: TasksType.archived,
    ),
    Task(
      id: 4,
      title: 'Task 1',
      description: 'Description 1',
      date: '01/01/2021',
      status: TasksType.all,
    ),
    Task(
      id: 5,
      title: 'Task 2',
      description: 'Description 2',
      date: '01/01/2021',
      status: TasksType.done,
    ),
    Task(
      id: 6,
      title: 'Task 3',
      description: 'Description 3',
      date: '01/01/2021',
      status: TasksType.archived,
    ),
    Task(
      id: 7,
      title: 'Task 1',
      description: 'Description 1',
      date: '01/01/2021',
      status: TasksType.all,
    ),
    Task(
      id: 8,
      title: 'Task 2',
      description: 'Description 2',
      date: '01/01/2021',
      status: TasksType.done,
    ),
    Task(
      id: 9,
      title: 'Task 3',
      description: 'Description 3',
      date: '01/01/2021',
      status: TasksType.archived,
    ),
  ];

  void changeTaskType(int taskId, TasksType type) {
    tasksList.firstWhere((element) => element.id == taskId).status = type;
    emit(ChangeTaskTypeState());
  }
}
