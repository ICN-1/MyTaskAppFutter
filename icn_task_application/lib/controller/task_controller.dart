import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icn_task_application/models/task.dart';
import 'package:icn_task_application/reusable%20widgets/new_alert_dialog.dart';

class TaskController extends GetxController {
  var taskList = <Task>[].obs;
  int get totalTasks => taskList.length;
  int get completedTasks => taskList.where((task) => task.isCompleted).length;
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final TextEditingController _nameControllerEdit = TextEditingController();
  final TextEditingController _descriptionControllerEdit = TextEditingController();

  void toggleTaskCompletion(int index) {
    taskList[index].isCompleted = !taskList[index].isCompleted;
    taskList.refresh(); 
  }

  void deleteTask(int index) {
    taskList.removeAt(index);
  }

  void addTask(Task task) {
    taskList.add(task);
  }

  void addTask2(Task task, context) {
    taskList.add(task);
    _nameControllerEdit.clear();
    _descriptionControllerEdit.clear();
    Navigator.of(context).pop();
  }

  void edit(context){
    _nameControllerEdit.clear();
    _descriptionControllerEdit.clear();
    Navigator.of(context).pop();
  }

  void onEdit(index, Task task){
    taskList[index] = task;
    _nameControllerEdit.clear();
    _descriptionControllerEdit.clear();
  }

  void editTask(index, context, Task task){
    _nameControllerEdit.text = task.title ?? 'No Title';
    _descriptionControllerEdit.text = task.description ?? 'No Description';
    
    showDialog(
      context: context, 
      builder: ((context) => CreateAlertDialog(
        taskName: 'Task Name', 
        taskDescription: 'Task Description', 
        taskNameHint: 'Give your project a name...', 
        taskDescriptionHint: 'Give your project a description...', 
        task: task,
        nameController: _nameControllerEdit,
        descriptionController: _descriptionControllerEdit,
        dialogName: 'Edit Task', 
        onEdit: () {
          task.title = _nameControllerEdit.text;
          task.description = _descriptionControllerEdit.text;
          onEdit(index, task);
        },
        onSave: () {
          edit(context);
        }, 
      )),
    );
  }
}