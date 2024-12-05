import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icn_task_application/controller/task_controller.dart';
import 'package:icn_task_application/models/task.dart';
import 'package:intl/intl.dart';

class NewTaskScreen extends StatelessWidget {
  final TaskController taskController = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy, MMM dd').format(now);

    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Task Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Task Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Task newTask = Task(
                  title: titleController.text,
                  description: descriptionController.text, 
                  dateCreated: formattedDate,
                );
                taskController.addTask(newTask);
                Get.back();
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}