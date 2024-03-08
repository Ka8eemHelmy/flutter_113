import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/material.dart';
import 'package:flutter_113/model/task/task_model.dart' as task;
import 'package:flutter_113/view_model/data/local/shared_helper.dart';
import 'package:flutter_113/view_model/data/local/shared_keys.dart';
import 'package:flutter_113/view_model/data/network/dio_helper.dart';
import 'package:flutter_113/view_model/data/network/end_points.dart';
import 'package:flutter_113/view_model/enums/tasks_type.dart';
import 'package:flutter_113/view_model/firebase/firebase_keys.dart';
import 'package:flutter_113/view_model/utils/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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

  task.TaskModel? taskModel = task.TaskModel();

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
    FormData formData = FormData.fromMap(
      {
        ...newTask.toJson(),
        if (image != null) 'image': await MultipartFile.fromFile(image?.path ?? ''),
      },
    );
    await DioHelper.post(
      endPoint: EndPoints.tasks,
      withToken: true,
      formData: formData,
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
    status = task.status ?? 'new';
    image = null;
  }

  void reset() {
    titleController.clear();
    descriptionController.clear();
    startDateController.clear();
    endDateController.clear();
    image = null;
    status = 'new';
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
        '_method': 'PUT',
        ...editTask.toJson(),
      },
      withToken: true,
    ).then((value) {
      task.Task editedTask = task.Task.fromJson(value.data['data']);
      for (int i = 0; i < (taskModel?.data?.tasks ?? []).length; i++) {
        if (taskModel?.data?.tasks?[i].id == taskId) {
          taskModel?.data?.tasks?[i] = editedTask;
          break;
        }
      }
      emit(EditTaskSuccessState());
    }).catchError((error) {
      print(error);
      emit(EditTaskErrorState());
    });
  }

  final ImagePicker picker = ImagePicker();

  XFile? image;

  void pickImage() async {
    emit(PickImageLoadingState());
    image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    emit(PickImageSuccessState());
  }

  ScrollController scrollController = ScrollController();

  void initListener() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge && scrollController.position.pixels != 0) {
        /// Load More
        if ((taskModel?.data?.meta?.currentPage ?? 0) < (taskModel?.data?.meta?.lastPage ?? 0)) {
          getMoreTasks();
        }
      }
    });
  }

  int page = 2;
  bool hasMoreData = true;
  bool loading = false;

  Future<void> getMoreTasks() async {
    if (loading) {
      return;
    }
    loading = true;
    emit(GetMoreTasksLoadingState());
    await DioHelper.get(
      endPoint: EndPoints.tasks,
      withToken: true,
      queryParameters: {
        'page': (taskModel?.data?.meta?.currentPage ?? 0) + 1,
      },
    ).then((value) {
      if ((value.data['data']['tasks'] as List).isEmpty) {
        hasMoreData = false;
      }
      print(value.data);
      taskModel?.data?.meta = task.Meta.fromJson(value.data['data']['meta']);
      for (var i in value.data['data']['tasks']) {
        taskModel?.data?.tasks?.add(task.Task.fromJson(i));
      }
      loading = false;
      emit(GetMoreTasksSuccessState());
    }).catchError((error) {
      print(error);
      loading = false;
      emit(GetMoreTasksErrorState());
    });
  }

  var fireStore = FirebaseFirestore.instance;

  Future<void> addTaskFireStore() async {
    emit(AddTaskLoadingState());
    String? imageUrl;
    if(image != null){
      imageUrl = await uploadFileToStorage();
    }
    task.Task newTask = task.Task(
      title: titleController.text,
      description: descriptionController.text,
      startDate: startDateController.text,
      endDate: endDateController.text,
      userId: await SharedHelper.get(key: SharedKeys.userId),
      status: 'new',
      image: imageUrl,
    );
    await fireStore
        .collection(FirebaseKeys.tasks)
        .doc()
        .set(
          newTask.toJson(),
        )
        .then((value) {
      showToast('Task Added Successfully');
      emit(AddTaskSuccessState());
      // getTasksFireStore();
    }).catchError((error) {
      emit(AddTaskErrorState());
      throw error;
    });
  }

  List<task.Task> fireStoreTasks = [];

  Future<void> getTasksFireStore() async {
    emit(GetAllTasksLoadingState());
    fireStore
        .collection(FirebaseKeys.tasks)
        .where(
          'user_id',
          isEqualTo: await SharedHelper.get(key: SharedKeys.userId),
        )
        .snapshots()
        .listen((value) {
      fireStoreTasks = [];
      for (var i in value.docs) {
        var value = task.Task.fromFireStore(i);
        fireStoreTasks.add(value);
      }
      emit(GetAllTasksSuccessState());
    }, onError: (error) {
      emit(GetAllTasksErrorState());
      throw error;
    });
  }

  Future<void> updateTaskFireStore(String taskId) async {
    emit(EditTaskLoadingState());
    String? imageUrl;
    if(image != null){
      imageUrl = await uploadFileToStorage() ?? '';
    }
    task.Task editTask = task.Task(
      title: titleController.text,
      description: descriptionController.text,
      startDate: startDateController.text,
      endDate: endDateController.text,
      status: status,
      image: imageUrl,
    );
    await fireStore
        .collection(FirebaseKeys.tasks)
        .doc(taskId)
        .update(
          editTask.toJson(),
        )
        .then((value) {
      showToast('Task Updated Successfully');
      emit(EditTaskLoadingState());
      // getTasksFireStore();
    }).catchError((error) {
      emit(EditTaskErrorState());
      throw error;
    });
  }

  Future<void> deleteTaskFireStore(String taskId) async {
    emit(DeleteTaskLoadingState());
    await fireStore.collection(FirebaseKeys.tasks).doc(taskId).delete().then((value) {
      showToast('Task Deleted Successfully');
      emit(DeleteTaskSuccessState());
      // getTasksFireStore();
    }).catchError((error) {
      emit(DeleteTaskErrorState());
      throw error;
    });
  }

  Future<String?> uploadFileToStorage() async {
    await storage.FirebaseStorage.instance
        .ref('tasks/')
        .child(image?.name ?? 'Tasks App ${DateTime.now()}')
        .putFile(File(image?.path ?? '')).then((p0) {
          p0.ref.getDownloadURL().then((value) {
            return value;
          });
    }).catchError((error){
      throw error;
    });
  }
}
