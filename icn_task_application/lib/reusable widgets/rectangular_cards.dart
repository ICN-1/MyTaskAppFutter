import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RectangularCard extends StatelessWidget {
  const RectangularCard({super.key, required this.isDone, required this.taskName, required this.taskDescription, this.onChanged, this.onDelete, this.onPressed});
  
  final String taskName, taskDescription;
  final bool isDone;
  final Function()? onPressed;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(), 
        children: [
          SlidableAction(
            onPressed: onDelete,
            icon: Icons.delete,
            backgroundColor: Colors.indigoAccent[400]!,
            borderRadius: BorderRadius.circular(10.0),
          )
        ]
      ),
      child: Card(
        elevation: 3.0,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListTile(
            leading: Checkbox(
              value: isDone, 
              onChanged: onChanged,
              shape: CircleBorder(),
              checkColor: Colors.white,
              activeColor: Colors.indigoAccent[400]
            ),
      
            title: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14.0
                    ),
                  ),
              
                  Text(
                    taskDescription,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ]
              ),
            )
          ),
        ),
      ),
    );
  }
}