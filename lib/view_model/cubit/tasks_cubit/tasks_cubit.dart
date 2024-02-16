import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_113/model/task/task_model.dart' as task;
import 'package:flutter_113/view_model/data/local/shared_helper.dart';
import 'package:flutter_113/view_model/data/local/shared_keys.dart';
import 'package:flutter_113/view_model/data/network/dio_helper.dart';
import 'package:flutter_113/view_model/data/network/end_points.dart';
import 'package:flutter_113/view_model/enums/tasks_type.dart';
import 'package:flutter_113/view_model/utils/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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

  task.TaskModel? taskModel;

  Future<void> getAllTasks() async {
    emit(GetAllTasksLoadingState());
    await DioHelper.get(
      endPoint: EndPoints.tasks,
      withToken: true,
    ).then((value) {
      taskModel = task.TaskModel.fromJson(value.data);
      emit(GetAllTasksSuccessState());
    }).catchError((error) {
      if (error is DioException) {
        print(error.response?.data);
        showToast(error.response?.data['message'] ?? 'Error on Get All Tasks');
        if (error.response?.statusCode == 401) {
          emit(TokenExpired());
        }
      }
      emit(GetAllTasksErrorState());
    });
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  String status = 'new';

  void changeStatusOfTask(String status) {
    this.status = status;
    emit(ChangeTaskStatusState());
  }

  Future<void> addTask() async {
    emit(AddTaskLoadingState());
    task.Task newTask = task.Task(
      title: titleController.text,
      description: descriptionController.text,
      startDate: startDateController.text,
      endDate: endDateController.text,
      status: 'new',
    );
    await DioHelper.post(
      endPoint: EndPoints.tasks,
      withToken: true,
      body: newTask.toJson(),
    ).then((value) {
      print(value.data);
      task.Task addedTask = task.Task.fromJson(value.data['data']);
      taskModel?.data?.tasks?.add(addedTask);
      showToast('Task Added Successfully');
      emit(AddTaskSuccessState());
      reset();
    }).catchError((error) {
      if (error is DioException) {
        print(error.response?.data);
        showToast(
          error.response?.data['message'].toString() ?? 'Error on Add Task',
          color: Colors.red,
        );
      }
      emit(AddTaskErrorState());
      throw error;
    });
  }

  void init(task.Task task) {
    titleController.text = task.title ?? '';
    descriptionController.text = task.description ?? '';
    startDateController.text = task.startDate ?? '';
    endDateController.text = task.endDate ?? '';
  }

  void reset() {
    titleController.clear();
    descriptionController.clear();
    startDateController.clear();
    endDateController.clear();
  }

  Future<void> deleteTask(int taskId) async {
    emit(DeleteTaskLoadingState());
    await DioHelper.delete(
      endPoint: '${EndPoints.tasks}/$taskId',
      withToken: true,
    ).then((value) {
      print(value.data);
      showToast('Task Deleted Successfully');
      emit(DeleteTaskSuccessState());
      getAllTasks();
    }).catchError((error) {
      if (error is DioException) {
        print(error.response?.data);
        showToast(
          error.response?.data?['message'].toString() ?? 'Error on Delete Task',
          color: Colors.red,
        );
      }
      emit(DeleteTaskErrorState());
      throw error;
    });
  }

  Future<void> editTask(int taskId) async {
    emit(EditTaskLoadingState());
    task.Task editTask = task.Task(
      title: titleController.text,
      description: descriptionController.text,
      startDate: startDateController.text,
      endDate: endDateController.text,
      status: status,
    );
    await DioHelper.post(
      endPoint: '${EndPoints.tasks}/$taskId',
      body: {
        '_method' : 'PUT',
        ...editTask.toJson(),
      },
      withToken: true,
    ).then((value) {
      task.Task editedTask = task.Task.fromJson(value.data['data']);
      for(int i = 0; i < (taskModel?.data?.tasks ?? []).length; i++){
        if(taskModel?.data?.tasks?[i].id == taskId){
          taskModel?.data?.tasks?[i] = editedTask;
          break;
        }
      }
      emit(EditTaskSuccessState());
    }).catchError((error){
      print(error);
      emit(EditTaskErrorState());
    });
  }

  final ImagePicker picker = ImagePicker();

  XFile? image;

  void pickImage () async {
    emit(PickImageLoadingState());
    image = await picker.pickImage(source: ImageSource.gallery);
    emit(PickImageSuccessState());
  }
}
