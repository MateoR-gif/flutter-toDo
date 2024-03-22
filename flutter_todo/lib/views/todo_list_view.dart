import 'package:flutter/material.dart';
import 'package:flutter_todo/views/gepeto.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  List<Task> _tasks = [
    Task(name: 'Tarea 1', isCompleted: false),
    Task(name: 'Tarea 2', isCompleted: true),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _tasks[index].name,
              style: TextStyle(
                decoration: _tasks[index].isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          );
        },
      ),
    );
  }
}
