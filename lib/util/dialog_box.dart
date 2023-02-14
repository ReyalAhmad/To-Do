import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';

class Dialog_Box extends StatelessWidget {
  final controller ;
  VoidCallback onSave;
  VoidCallback onCancel;
   Dialog_Box({super.key,required this.controller, required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: Colors.teal[100],
      content: Container(
        height: height*0.16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller ,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius:BorderRadius.circular(15)
              ),
              hintText:'Add New Task', 
              ),
            ),
            //button=> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                 MyButton(text: 'Save', onPressed:onSave),
                 SizedBox(
                  width: 15,
                 ),
                //cancel button
                MyButton(text: 'Cancel', onPressed:onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}