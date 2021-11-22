import 'package:flutter/material.dart';
import 'package:flutter_todo/config/color_constants.dart';
import 'package:flutter_todo/config/image_constants.dart';
import 'package:flutter_todo/models/todo.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _checkbox(),
        _avatar(),
        _userName(),
      ],
    );
  }

  Container _userName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/details/${widget.todo.id}');
        },
        child: Text(
          widget.todo.title,
          style: const TextStyle(
            fontSize: 24.0,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Color(0x80000000),
                offset: Offset(0.0, 1.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _avatar() {
    return Container(
      margin: const EdgeInsets.all(12.0),
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: ColorConstants.lightBlueColor,
        image: DecorationImage(
          image: widget.todo.image != ''
              ? NetworkImage(widget.todo.image)
              : NetworkImage(AllImages().defaultImage),
          fit: BoxFit.contain,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(
          color: Colors.white,
          width: 4.0,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 4.0),
            blurRadius: 6.0,
          ),
        ],
      ),
    );
  }

  Checkbox _checkbox() {
    return Checkbox(
      value: widget.todo.isChecked,
      checkColor: ColorConstants.creamColor,
      activeColor: ColorConstants.mintColor,
      onChanged: (bool? value) {
        setState(() {
          widget.todo.isChecked = value!;
        });
      },
    );
  }
}
