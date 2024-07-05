import 'package:flutter/material.dart';
import 'package:icn_task_application/reusable%20widgets/textFormFields.dart';

class CreateAlertDialog extends StatefulWidget {
  const CreateAlertDialog({
    super.key, 
    required this.taskName, 
    required this.taskDescription, 
    required this.taskNameHint, 
    required this.taskDescriptionHint, 
    required this.taskNameController, 
    required this.taskDescriptionController, 
    required this.dialogName, required this.onSave, this.editName, this.editHint, this.onEdit
  });

  final String dialogName, taskName, taskDescription, taskNameHint, taskDescriptionHint;
  final String? editName, editHint;
  final TextEditingController taskNameController, taskDescriptionController;
  final VoidCallback onSave;
  final Function()? onEdit;

  @override
  State<CreateAlertDialog> createState() => _CreateAlertDialogState();
}

class _CreateAlertDialogState extends State<CreateAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.dialogName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24
              ),
              textAlign: TextAlign.start,
            ),
        
            MyTextField(
              fieldHeader: widget.taskName, 
              fieldHint: widget.taskNameHint,
              nameController: widget.taskNameController,
            ),
        
            MyTextField(
              fieldHeader: widget.taskDescription, 
              fieldHint: widget.taskDescriptionHint,
              nameController: widget.taskDescriptionController,
            ),
        
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.grey),
                      side: WidgetStateProperty.all<BorderSide>(
                        const BorderSide(
                          color: Colors.black,
                          width: 1.0
                        )
                      )
                    ), 
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                      ),
                    ),
                  ),
                      
                  ElevatedButton(
                    onPressed: (){
                      widget.onSave();
                      if (widget.dialogName == 'Edit Task') {
                        widget.onEdit!();
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.indigoAccent)
                    ), 
                    child: const Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      )
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}