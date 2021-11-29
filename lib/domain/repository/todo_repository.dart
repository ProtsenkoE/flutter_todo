import 'package:flutter/foundation.dart';
import 'package:flutter_todo/data/store/firebase_store.dart';

class TodoRepository extends ChangeNotifier {
  final FirebaseStore firebaseStore;

  TodoRepository({required this.firebaseStore});

  getTodosStream() => firebaseStore.getTodosStream();

  addItem(String title) {
    firebaseStore.addItem(title);
  }

  updateItem(bool isChecked, String id) {
    firebaseStore.updateItem(isChecked, id);
  }

  deleteItem(String id) {
    firebaseStore.deleteItem(id);
  }

  getTodoDetails(String id) => firebaseStore.getTodoDetails(id);
}
