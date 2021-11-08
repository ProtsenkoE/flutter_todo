import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/widgets/todo_item.dart';

class TodoItemWrapper extends StatelessWidget {
  const TodoItemWrapper({
    Key? key,
    required this.todoList,
  }) : super(key: key);

  final List<Todo> todoList;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 134.0,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                var item = todoList[index];
                return TodoItem(todo: item);
              },
            ),
          )
        ],
      ),
    );
  }
}
