import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/models/task.dart';

class TaskController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final String collection = "tasks";

  Future<String> create(Task task) async {
    DocumentReference response = await db.collection(collection).add({
      'name': task.name,
      'isCompleted': task.isCompleted,
    });
    return response.id;
  }

  Future<void> createWithId(Task task, String id) async{
    await db.collection(collection).doc(id).set(task.toMap());
  }

  Future<void> updateWithId(Task task, String id) async{
    await db.collection(collection).doc(id).update(task.toMap());
  }

  Future<void> remove(String id) async{
    await db.collection(collection).doc(id).delete();
  }
}
