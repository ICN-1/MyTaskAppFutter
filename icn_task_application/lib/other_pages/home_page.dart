import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icn_task_application/other_pages/new_task_or_project.dart';
import 'package:icn_task_application/reusable%20widgets/big_button.dart';
import 'package:icn_task_application/reusable%20widgets/floatingButton.dart';
import 'package:icn_task_application/reusable%20widgets/new_alert_dialog.dart';
import 'package:icn_task_application/reusable%20widgets/rectangular_cards.dart';
import 'package:icn_task_application/reusable%20widgets/square_cards.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.name});

  final String? name;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  TextEditingController _nameControllerEdit = TextEditingController();
  TextEditingController _descriptionControllerEdit = TextEditingController();
  List taskList = [];
  int totalNumberTask = 0, totalCompletedTask = 0, num = 0, index2 = 0;
  bool isTrue = true;

  void save(){
    setState(() {
      taskList.add([
        _nameController.text, 
        _descriptionController.text,
        false
      ]);
      _nameController.clear();
      _descriptionController.clear();
      
    });
    Navigator.of(context).pop();
  }

  void edit(){
    setState(() {
      _nameController.clear();
      _descriptionController.clear();
    });
    Navigator.of(context).pop();
  }

  void onEdit(index){
    setState(() {
      taskList[index] = [
        _nameControllerEdit.text,
        _descriptionControllerEdit.text,
        taskList[index][2], 
      ];
      _nameControllerEdit.clear();
      _descriptionControllerEdit.clear();
    });
  }

  void onSelect(name, description, index){
    _nameControllerEdit.text = name;
    _descriptionControllerEdit.text = description;
    
    showDialog(
      context: context, 
      builder: ((context) => CreateAlertDialog(
        taskName: 'Task Name', 
        taskDescription: 'Task Description', 
        taskNameHint: 'Give your project a name...', 
        taskDescriptionHint: 'Give your project a description...', 
        taskNameController: _nameControllerEdit, 
        taskDescriptionController: _descriptionControllerEdit, 
        dialogName: 'Edit Task', 
        onEdit: () => onEdit(index),
        onSave: () {
          edit();
        }
      )),
    );
  }

  void taskCompleted(bool? value, int index){
    setState(() {
      taskList[index][2] = !taskList[index][2];
    });
  }

  void deleteTask(int index){
    setState(() {
      taskList.removeAt(index);
    });
  }

  void numberTask() {
    int completedCount = 0;
    taskList.forEach((task) {
      if (task[2] == true) {
        completedCount++;
      }
    });
    setState(() {
      totalNumberTask = taskList.length;
      totalCompletedTask = completedCount;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy, MMM dd').format(now);
    double statusBarHeight = MediaQuery.of(context).padding.top + 10.0;
    numberTask();

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
                style: TextStyle(
              
                )
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
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
      
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search_rounded),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
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
                      child: SquareCards(
                        cardIcon: '📦',
                        cardName: 'Total Tasks',
                        cardNumber: totalNumberTask.toString()
                      )
                    ),
                  ),
              
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: SquareCards(
                        cardIcon: '🙌',
                        cardName: 'Completed Tasks',
                        cardNumber: totalCompletedTask.toString()
                      ),
                    ),
                  )
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
                        color: Colors.indigoAccent[400]
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                    ),
                  ),
              
                  Text(
                    'Tasks of the day',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black
                    ),
                  )
                ],
              ),
            ),
      
            Flexible(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index){
                  return RectangularCard(
                    onSelect: () => onSelect(taskList[index][0], taskList[index][1], index),
                    onChanged: (value) => taskCompleted(value, index),
                    onDelete: (value) => deleteTask(index),
                    isDone: taskList[index][2],
                    taskName: taskList[index][0],
                    taskDescription: taskList[index][1],
                  );
                }
              ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingButton(
        heroTag: 'create_new_hero_tag',
        backgroundColor: Colors.indigoAccent[400]!,
        icon: Icons.add_rounded,
        iconColor: Colors.white,
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false, 
              pageBuilder: (BuildContext context, _, __) {
                return FloatBtnOptions(
                  onSave: () => save(), 
                  nameController: _nameController, 
                  descriptionController: _descriptionController,
                );
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
        },
      )
    );
  }
}