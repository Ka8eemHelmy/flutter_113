import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_113/model/task/task_model.dart';
import 'package:flutter_113/view/components/widgets/text_custom.dart';
import 'package:flutter_113/view_model/cubit/tasks_cubit/tasks_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../view_model/data/local/shared_helper.dart';
import '../../../view_model/data/local/shared_keys.dart';
import '../../components/widgets/text_form_field_custom.dart';

class AddTask extends StatelessWidget {
  final Task? task;

  const AddTask({this.task, super.key});

  @override
  Widget build(BuildContext context) {
    if (task != null) {
      TasksCubit.get(context).init(task ?? Task());
    } else {
      TasksCubit.get(context).reset();
    }
    return SafeArea(
      child: Form(
        key: TasksCubit.get(context).formKey,
        child: ListView(
          padding: const EdgeInsets.all(12),
          shrinkWrap: true,
          children: [
            TextCustom(
              text: task == null ? 'Add Task' : 'Edit Task',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormFieldCustom(
              controller: TasksCubit.get(context).titleController,
              labelText: 'Title',
              validator: (value) {
                if ((value ?? '').trim().isEmpty) {
                  return 'Please, Enter Title of Task';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormFieldCustom(
              controller: TasksCubit.get(context).descriptionController,
              labelText: 'Description',
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormFieldCustom(
              controller: TasksCubit.get(context).startDateController,
              labelText: 'Start Date',
              keyboardType: TextInputType.none,
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 1),
                ).then((value) {
                  if (value != null) {
                    TasksCubit.get(context).startDateController.text = DateFormat('yyyy-MM-dd').format(value);
                  }
                });
              },
              validator: (value) {
                if ((value ?? '').trim().isEmpty) {
                  return 'Please, Enter Start Date of the Task';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormFieldCustom(
              controller: TasksCubit.get(context).endDateController,
              labelText: 'End Date',
              keyboardType: TextInputType.none,
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 1),
                ).then((value) {
                  if (value != null) {
                    TasksCubit.get(context).endDateController.text = DateFormat('yyyy-MM-dd').format(value);
                  }
                });
              },
              validator: (value) {
                if ((value ?? '').trim().isEmpty) {
                  return 'Please, Enter End Date of the Task';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            if (task != null)
              DropdownButtonFormField(
                value: task?.status,
                items: const [
                  DropdownMenuItem(
                    value: 'new',
                    child: TextCustom(
                      text: 'New',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'doing',
                    child: TextCustom(
                      text: 'Doing',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'outdated',
                    child: TextCustom(
                      text: 'Outdated',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'compeleted',
                    child: TextCustom(
                      text: 'Compeleted',
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    TasksCubit.get(context).changeStatusOfTask(value);
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please, Select Status of Task';
                  }
                  return null;
                },
              ),
            const SizedBox(
              height: 10,
            ),
            Material(
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: () async {
                  await Permission.photos.request();
                  var status = await Permission.photos.status;
                  if (status == PermissionStatus.granted) {
                    TasksCubit.get(context).pickImage();
                  } else {
                    await Permission.photos.request();
                  }
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.red,
                    ),
                  ),
                  child: BlocBuilder<TasksCubit, TasksState>(
                    builder: (context, state) {
                      var cubit = TasksCubit.get(context);
                      return Visibility(
                        visible: cubit.image == null,
                        replacement: Image.file(
                          File(cubit.image?.path ?? ''),
                          fit: BoxFit.cover,
                        ),
                        child: Visibility(
                          visible: task?.image == null && cubit.image == null,
                          replacement: Image.network(
                            task?.image ?? '',
                            width: 100,
                            height: 100,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 50,
                                child: Image.network(
                                  'https://static.thenounproject.com/png/1854458-200.png',
                                  width: 100,
                                  height: 50,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextCustom(text: 'Add Image to Your Task'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<TasksCubit, TasksState>(
              builder: (context, state) {
                return Visibility(
                  visible: state is AddTaskLoadingState,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: LinearProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
            if (task == null)
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    // print(await SharedHelper.get(key: SharedKeys.userId));
                    // return;
                    if (TasksCubit.get(context).formKey.currentState!.validate()) {
                      TasksCubit.get(context).addTaskFireStore().then((value) {
                        Navigator.pop(context);
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const TextCustom(
                    text: 'Add',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            if (task != null)
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // if (TasksCubit.get(context).formKey.currentState!.validate()) {
                          //   TasksCubit.get(context).addTask().then((value) {
                          //     Navigator.pop(context);
                          //   });
                          // }
                          showDialog(
                            context: context,
                            useSafeArea: true,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: TextCustom(
                                  text: 'Are You Sure of Delete This task ?',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                actions: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: TextCustom(
                                                text: 'No',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                TasksCubit.get(context).deleteTaskFireStore(task?.taskId ?? '').then((value) {
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: TextCustom(
                                                text: 'Yes',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                        child: const TextCustom(
                          text: 'Delete',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (TasksCubit.get(context).formKey.currentState!.validate()) {
                            TasksCubit.get(context).updateTaskFireStore(task?.taskId ?? '').then((value) {
                              Navigator.pop(context);
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: BlocBuilder<TasksCubit, TasksState>(
                          builder: (context, state) {
                            return state is EditTaskLoadingState
                                ? const CircularProgressIndicator.adaptive()
                                : const TextCustom(
                                    text: 'Edit',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
