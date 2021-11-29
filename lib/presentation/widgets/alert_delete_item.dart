import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/config/string_constants.dart' as string_constants;
import 'package:flutter_todo/domain/repository/todo_repository.dart';
import 'package:flutter_todo/presentation/widgets/todo_item.dart';
import 'package:provider/provider.dart';

class AlertDeleteItem extends StatelessWidget {
  const AlertDeleteItem({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final TodoItem widget;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text(string_constants.deleteItem),
      actions: [
        TextButton(
          child: const Text(
            string_constants.cancelButton,
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text(
            string_constants.deleteButton,
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Provider.of<TodoRepository>(context, listen: false)
                .deleteItem(widget.todo.id!);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
