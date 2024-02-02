import 'package:flutter/material.dart';
import 'package:flutter_113/model/task/task_model.dart';
import 'package:flutter_113/view/components/widgets/text_custom.dart';
import 'package:flutter_113/view_model/cubit/tasks_cubit/tasks_cubit.dart';
import 'package:intl/intl.dart';
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
              height: 20,
            ),
            if (task == null)
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (TasksCubit.get(context).formKey.currentState!.validate()) {
                      TasksCubit.get(context).addTask().then((value) {
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
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                              child: TextCustom(
                                                text: 'No',
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: (){
                                                TasksCubit.get(context).deleteTask(task?.id ?? 0).then((value) {
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
                          // if (TasksCubit.get(context).formKey.currentState!.validate()) {
                          //   TasksCubit.get(context).addTask().then((value) {
                          //     Navigator.pop(context);
                          //   });
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const TextCustom(
                          text: 'Edit',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
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