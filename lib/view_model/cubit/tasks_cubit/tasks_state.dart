part of 'tasks_cubit.dart';

@immutable
abstract class TasksState {}

class TasksInitial extends TasksState {}

class ChangeTaskTypeState extends TasksState {}

class GetAllTasksLoadingState extends TasksState {}

class GetAllTasksSuccessState extends TasksState {}

class GetAllTasksErrorState extends TasksState {}

class TokenExpired extends TasksState {}

class AddTaskLoadingState extends TasksState {}

class AddTaskSuccessState extends TasksState {}

class AddTaskErrorState extends TasksState {}

class DeleteTaskLoadingState extends TasksState {}

class DeleteTaskSuccessState extends TasksState {}

class DeleteTaskErrorState extends TasksState {}
