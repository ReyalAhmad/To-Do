import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onchanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.deleteFunction,
      required this.taskCompleted,
      required this.onchanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 23, right: 23, top: 23),
      child: Slidable(
        endActionPane:ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction,
            borderRadius: BorderRadius.circular(10),
            icon: Icons.delete,
            backgroundColor:Colors.redAccent),
          ],
         
        ),
        child: Container(
          padding: EdgeInsets.all(21),
          child: Row(
            children: [
              //checkbox//
              Checkbox(
                  value: taskCompleted,
                  checkColor: Colors.black,
                  activeColor: Colors.white,
                  onChanged: onchanged),
      
              SizedBox(
                width: 8,
              ),
              //task name//
              Text(taskName,
                  style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: Colors.white,
                      fontSize: 25)),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.teal, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
