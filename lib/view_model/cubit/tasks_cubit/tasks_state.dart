part of 'tasks_cubit.dart';

@immutable
abstract class TasksState {}

class TasksInitial extends TasksState {}

class ChangeTaskTypeState extends TasksState {}
