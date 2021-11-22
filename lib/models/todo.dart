import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/config/string_constants.dart' as string_constants;

class Todo {
  late String title;
  late String image;
  late bool isChecked;
  String? id;

  Todo(
      {required this.title,
      required this.isChecked,
      required this.image,
      this.id});

  static List<Todo> getTodoList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Todo(
        isChecked: doc['isChecked'],
        image: doc['image'],
        title: doc['title'],
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
      );
    } else {
      return Todo(
        isChecked: false,
        image: '',
        title: '',
      );
    }
  }
}
