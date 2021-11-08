import 'package:flutter/material.dart';
import 'package:flutter_todo/src/config/color_constants.dart';
import 'package:flutter_todo/src/config/image_constants.dart';
import 'package:flutter_todo/src/models/todo.dart';

class TodoWrapperScreen extends StatelessWidget {
  final Todo todo;

  const TodoWrapperScreen({
    Key? key,
    required this.todo,
  }) : super(key: key);

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
      child: Text(
        todo.title,
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
          image: todo.image != ''
              ? NetworkImage(todo.image)
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
      value: true,
      checkColor: ColorConstants.creamColor,
      activeColor: ColorConstants.mintColor,
      onChanged: (bool? value) {},
    );
  }
}
