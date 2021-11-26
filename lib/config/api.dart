import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/config/string_constants.dart' as string_constants;
import 'package:flutter_todo/models/todo.dart';

class Api {
  static final fireStore = FirebaseFirestore.instance;

  static void addItem(String newTitle) {
    fireStore.collection(string_constants.todos).add({
      'title': newTitle,
      'image':
          'https://firebasestorage.googleapis.com/v0/b/todoa-5403a.appspot.com/o/todo.png?alt=media&token=e585808f-3405-4004-9f4a-3fc5ee42fa19',
      'isChecked': false,
      'createdAt': Timestamp.now(),
    });
  }

  static void updateItem(bool isChecked, String id) {
    fireStore.collection(string_constants.todos).doc(id).update({
      'isChecked': isChecked,
    });
  }

  static void deleteItem(String id) {
    fireStore.collection(string_constants.todos).doc(id).delete();
  }

  static List<Todo> getTodoList(QuerySnapshot snapshot) {
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

  static Future<Todo> getTodoDetails(String id) async {
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
      return Todo(
        isChecked: false,
        image: '',
        title: '',
        createdAt: '',
      );
    }
  }
}
