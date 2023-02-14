import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/home_page.dart';
import 'package:hive/hive.dart';

void main() async{
  // init the hive
   await Hive.initFlutter();
   // open a box
   var box = await Hive.openBox('mybox');
  runApp(ToDoApp());
}
class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      
    );
  }
}
