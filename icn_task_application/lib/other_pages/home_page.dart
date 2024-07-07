import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icn_task_application/controller/task_controller.dart';
import 'package:icn_task_application/models/task.dart';
import 'package:icn_task_application/other_pages/new_task_or_project.dart';
import 'package:icn_task_application/other_pages/new_task_screen.dart';
import 'package:icn_task_application/other_pages/task_details_screen.dart';
import 'package:icn_task_application/reusable%20widgets/floatingButton.dart';
import 'package:icn_task_application/reusable%20widgets/rectangular_cards.dart';
import 'package:icn_task_application/reusable%20widgets/square_cards.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final String? name;

  HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskController taskController = Get.put(TaskController());
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy, MMM dd').format(now);
    double statusBarHeight = MediaQuery.of(context).padding.top + 10.0;
    Task task = Task(title: _nameController.text, description: _descriptionController.text, dateCreated: formattedDate);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, statusBarHeight, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                formattedDate,
                style: const TextStyle(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hello, ${widget.name ?? 'Guest'} 👋',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search_rounded),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.notifications_none_rounded),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: Obx(() => SquareCards(
                        cardIcon: '📦',
                        cardName: 'Total Tasks',
                        cardNumber: taskController.totalTasks.toString(),
                      )),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Obx(() => SquareCards(
                        cardIcon: '🙌',
                        cardName: 'Completed Tasks',
                        cardNumber: taskController.completedTasks.toString(),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.indigoAccent[400],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                    ),
                  ),
                  const Text(
                    'Tasks of the day',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Obx(() => ListView.builder(
                itemCount: taskController.taskList.length,
                itemBuilder: (context, index) {
                  final task = taskController.taskList[index];
                  return RectangularCard(
                    onSelect: () => Get.to(TaskDetailsScreen(task: task)),
                    onEdit: () => taskController.editTask(index, context, task),
                    onChanged: (value) => taskController.toggleTaskCompletion(index),
                    onDelete: (context) => taskController.deleteTask(index),
                    isDone: task.isCompleted,
                    taskName: task.title ?? 'No Title',
                    taskDescription: task.description ?? 'No Description',
                  );
                },
              )),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingButton(
        heroTag: 'create_new_hero_tag',
        backgroundColor: Colors.indigoAccent[400]!,
        icon: Icons.add_rounded,
        iconColor: Colors.white,
        onPressed: () => Get.to(
          () => FloatBtnOptions(
            onSave: () {  
              task.title = _nameController.text;
              task.description = _descriptionController.text;
              taskController.addTask2(task, context);
            },
            task: task, 
            nameController: _nameController, 
            descriptionController: _descriptionController,
          ),
          transition: Transition.fadeIn,
          opaque: false,
        ),
      ),
    );
  }
}