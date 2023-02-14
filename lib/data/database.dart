import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List toDoList =[];
  //reference our box
  final _myBox=Hive.box('myBox');
  //run this method if this is the first time ever opening this app
  void createInitialData(){
     toDoList =[
       ["huga mara sara",false],
       ["akash vora tara",false],
       ["huga mara sara",false],
       ["akash vora tara",false]
    ];
  }
 //load the data  from database
  void loadData(){
    toDoList=_myBox.get("TODOLIST");

  }

   //update the data from database
   void updateDataBase(){
        _myBox.put("TODOLIST", toDoList);
   }
}