import 'package:flutter/material.dart';
import 'package:flutter_todo/views/gepeto.dart';

class ToDoListScreen extends StatefulWidget{
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
    );
  }
}