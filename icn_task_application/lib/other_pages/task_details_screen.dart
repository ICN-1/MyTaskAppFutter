import 'package:flutter/material.dart';
import 'package:icn_task_application/models/task.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task task;
  TaskDetailsScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Task Title: ',
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.bold),
                ),

                Text(
                  task.title ?? 'No Title',
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Task Description: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),

                Text(
                  task.description ?? 'No Description',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Date Created: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),

                Text(
                  task.dateCreated ?? 'No Date',
                  style: TextStyle(
                    fontSize: 18
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),

                Text(
                  task.isCompleted ? "Completed" : "Not Completed",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}