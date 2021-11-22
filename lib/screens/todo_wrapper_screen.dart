import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/config/string_constants.dart' as string_constants;
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/widgets/button_up_panel.dart';
import 'package:flutter_todo/widgets/header_up_panel.dart';
import 'package:flutter_todo/widgets/main_up_panel.dart';
import 'package:flutter_todo/widgets/todo_item_wrapper.dart';
import 'package:flutter_todo/widgets/top_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

final PanelController _pc1 = PanelController();

class TodosWrapperScreen extends StatefulWidget {
  const TodosWrapperScreen({Key? key}) : super(key: key);

  @override
  State<TodosWrapperScreen> createState() => _TodosWrapperScreenState();
}

class _TodosWrapperScreenState extends State<TodosWrapperScreen> {
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(
      body: UpPanel(radius: radius),
    );
  }
}

class UpPanel extends StatelessWidget {
  const UpPanel({
    Key? key,
    required this.radius,
  }) : super(key: key);

  final BorderRadiusGeometry radius;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      maxHeight: 400.0,
      controller: _pc1,
      panel: const MainUpPanel(),
      collapsed: ButtonUpPanel(
        radius: radius,
        controller: _pc1,
      ),
      header: HeaderUpPanel(radius: radius),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(string_constants.todos)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SafeArea(
            child: Stack(
              children: [
                const TopBar(),
                TodoItemWrapper(todoList: Todo.getTodoList(snapshot.data)),
                // TodoItemWrapper(todoList: result),
              ],
            ),
          );
        },
      ),
      borderRadius: radius,
    );
  }
}
