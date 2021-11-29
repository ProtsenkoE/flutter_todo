import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/domain/models/todo.dart';

class Utils {
  static List<Todo> querySnapshotToTodoList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Todo(
        isChecked: doc['isChecked'],
        image: doc['image'],
        title: doc['title'],
        createdAt: doc['createdAt'],
        id: doc.id,
      );
    }).toList();
  }
}
