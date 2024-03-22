import 'package:flutter/material.dart';
import 'package:flutter_todo/views/todo_list_view.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List App',
      home: ToDoListScreen(),
    );
  }
}
