import '../view_model/enums/tasks_type.dart';

class Task {
  int? id;
  String? title;
  String? description;
  String? date;
  TasksType? status;

  Task({
    this.id,
    this.title,
    this.description,
    this.date,
    this.status,
  });
}