import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    //reference the hive box
    final _myBox= Hive.box('mybox');
    ToDoDataBase db=ToDoDataBase();
      
      @override
  void initState() {
    //run this method if this is the first time ever opening this app then create defult data
    if(_myBox.get("TODOLIST")==null){
          db.createInitialData();
    }
    else{
      //there alraedy exists data
      db.loadData();
    };
    super.initState();
  }

  //text controller
    final _controller = TextEditingController();
 
  //save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }
  //create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog_Box(
            controller: _controller,
            onSave: saveNewTask,
            onCancel:() => Navigator.of(context).pop()
          );
        });
  }
  // delete task
  void deleteTask(int index){
  setState(() {
    db.toDoList.removeAt(index);
  });
  db.updateDataBase();
  }

  //CHECK BOX TAPPED//
  void checkBoxChanged(bool? value, index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      appBar: AppBar(
        elevation: 0,
        title: Text('TO DO',
            style: GoogleFonts.fredokaOne(
              fontSize: 25,
            )),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onchanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) =>deleteTask(index),
              );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
