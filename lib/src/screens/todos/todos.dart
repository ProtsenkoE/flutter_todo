import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/src/config/color_constants.dart';
import 'package:flutter_todo/src/models/todos.dart';
import 'package:flutter_todo/src/screens/todos/todo.dart';
import 'package:flutter_todo/src/config/image_constants.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_todo/src/config/string_constants.dart'
    as string_constant;

final PanelController _pc1 = PanelController();

class TodosList extends StatefulWidget {
  const TodosList({Key? key}) : super(key: key);

  @override
  State<TodosList> createState() => _TodosListState();
}

class _TodosListState extends State<TodosList> {
  @override
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
      controller: _pc1,
      panel: _panelMain(),
      collapsed: _openPanelButton(),
      header: _headerPanel(context),
      body: SafeArea(
        child: Stack(
          children: [
            const TopBar(),
            ListWrapper(todoItems: todoItems),
          ],
        ),
      ),
      borderRadius: radius,
    );
  }

  Container _headerPanel(BuildContext context) {
    return Container(
      height: 84.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorConstants.lightOrangeColor, ColorConstants.orangeColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: radius,
      ),
      child: const Center(
        child: Text(
          string_constant.addItem,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  GestureDetector _openPanelButton() {
    return GestureDetector(
      onTap: () {
        if (_pc1.isPanelClosed) {
          _pc1.open();
        } else {
          _pc1.close();
        }
      },
      child: Container(
        height: 84.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorConstants.lightOrangeColor,
              ColorConstants.orangeColor
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: radius,
        ),
        child: const Center(
          child: Text(
            string_constant.addItem,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }

  Center _panelMain() {
    return const Center(
      child: Text("Sliding Widget"),
    );
  }
}

class ListWrapper extends StatelessWidget {
  const ListWrapper({
    Key? key,
    required this.todoItems,
  }) : super(key: key);

  final List<Todos> todoItems;

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
              itemCount: todoItems.length,
              itemBuilder: (context, index) {
                var item = todoItems[index];
                return Todo(todos: item);
              },
            ),
          )
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage('${AllImages().image}/bg_top.png'),
      ),
    );
  }
}
