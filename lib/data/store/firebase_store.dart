import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/config/string_constants.dart' as string_constants;
import 'package:flutter_todo/domain/models/todo.dart';

class FirebaseStore {
  final _fireStore = FirebaseFirestore.instance;

  Stream getTodosStream() => _fireStore
      .collection(string_constants.todos)
      .orderBy('createdAt', descending: true)
      .snapshots();

  void addItem(String title) {
    _fireStore.collection(string_constants.todos).add({
      'title': title,
      'image':
          'https://firebasestorage.googleapis.com/v0/b/todoa-5403a.appspot.com/o/todo.png?alt=media&token=e585808f-3405-4004-9f4a-3fc5ee42fa19',
      'isChecked': false,
      'createdAt': Timestamp.now(),
    });
  }

  void updateItem(bool isChecked, String id) {
    _fireStore.collection(string_constants.todos).doc(id).update({
      'isChecked': isChecked,
    });
  }

  void deleteItem(String id) {
    _fireStore.collection(string_constants.todos).doc(id).delete();
  }

  Future<Todo> getTodoDetails(String id) async {
    var collection =
        FirebaseFirestore.instance.collection(string_constants.todos);
    var docSnapshot = await collection.doc(id).get();

    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();

      return Todo(
        isChecked: data?['isChecked'],
        image: data?['image'],
        title: data?['title'],
        createdAt: data?['createdAt'],
      );
    } else {
      return const Todo(
        isChecked: false,
        image: '',
        title: '',
        createdAt: '',
      );
    }
  }
}
