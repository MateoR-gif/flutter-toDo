import 'package:flutter/material.dart';
import 'package:flutter_todo/models/task.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  List<Task> _tasks = [];

  void _addTask(String taskName) {
    setState(() {
      _tasks.add(Task(name: taskName));
    });
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

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
            leading: Checkbox(
              value: _tasks[index].isCompleted,
              onChanged: (_) => _toggleTask(index),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteTask(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTaskName = await showDialog<String>(
            context: context,
            builder: (context) {
              String taskName = '';
              return AlertDialog(
                title: Text('Agregar Tarea'),
                content: TextField(
                  onChanged: (value) {
                    taskName = value;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, taskName);
                    },
                    child: Text('Agregar'),
                  ),
                ],
              );
            },
          );
          if (newTaskName != null && newTaskName.isNotEmpty) {
            _addTask(newTaskName);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
