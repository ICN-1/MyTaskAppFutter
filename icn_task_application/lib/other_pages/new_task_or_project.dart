import 'package:flutter/material.dart';
import 'package:icn_task_application/reusable%20widgets/floatingButton.dart';
import 'package:icn_task_application/reusable%20widgets/new_alert_dialog.dart';

class FloatBtnOptions extends StatelessWidget {
  FloatBtnOptions({
    Key? key, 
    required this.onSave, 
    required this.nameController, 
    required this.descriptionController
  }) : super(key: key);

  final VoidCallback onSave;
  final TextEditingController nameController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(16.0), 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end, 
            children: [
              Row(
                mainAxisSize: MainAxisSize.min, 
                children: [
                  Text(
                    'Create a Task',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: FloatingButton(
                      heroTag: 'new_tadk_hero_tag',
                      icon: Icons.check_circle_outline_rounded,
                      onPressed: () {
                        Navigator.of(context).pop();
                        showDialog(
                          context: context,
                          builder: ((context) => CreateAlertDialog(
                            dialogName: 'Create a Task',
                            taskName: 'Task Name', 
                            taskDescription: 'Task Description', 
                            taskNameHint: 'Give your task a name...', 
                            taskDescriptionHint: 'Give your task aescription...', 
                            taskNameController: nameController, 
                            taskDescriptionController: descriptionController, 
                            onSave: () {
                              onSave();
                            },
                          )),
                        );
                      },
                      iconColor: Colors.white,
                      backgroundColor: Colors.indigoAccent[400]!,
                    ),
                  ),
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Create a Project',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                     
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: FloatingButton(
                        heroTag: 'new_project_hero_tag',
                        icon: Icons.description_outlined,
                        onPressed: () {
                          // Navigator.of(context).pop();
                          // showDialog(
                          //   context: context,
                            // builder: ((context) => CreateAlertDialog(
                            //   taskName: 'Project Name', 
                            //   taskDescription: 'Project Description', 
                            //   taskNameHint: 'Give your project a name...', 
                            //   taskDescriptionHint: 'Give your project a description...', 
                            //   taskNameController: nameController, 
                            //   taskDescriptionController: descriptionController, 
                            //   dialogName: 'Create a Project', 
                            //   onSave: () {  
                            //     onSave();
                            //   },
                            // )),
                          // );
                        },
                        iconColor: Colors.white,
                        backgroundColor: Colors.indigoAccent[400]!,
                      ),
                    ),
                  ],
                ),
              ),
               
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 100.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    FloatingButton(
                      heroTag: 'close_hero_tag',
                      icon: Icons.close_outlined,
                      onPressed: () {
                        Navigator.pop(context); 
                      },
                      iconColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ]
          )
        )
      )
    );
  }
}