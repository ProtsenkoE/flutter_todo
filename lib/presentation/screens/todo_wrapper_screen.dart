import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/config/string_constants.dart' as string_constants;
import 'package:flutter_todo/config/utils.dart';
import 'package:flutter_todo/domain/repository/todo_repository.dart';
import 'package:flutter_todo/presentation/widgets/header_up_panel.dart';
import 'package:flutter_todo/presentation/widgets/main_up_panel.dart';
import 'package:flutter_todo/presentation/widgets/todo_item_wrapper.dart';
import 'package:flutter_todo/presentation/widgets/top_bar.dart';
import 'package:provider/provider.dart';
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
      backdropEnabled: true,
      controller: _pc1,
      panel: MainUpPanel(controller: _pc1),
      collapsed: HeaderUpPanel(
        radius: radius,
        controller: _pc1,
      ),
      header: HeaderUpPanel(
        radius: radius,
        controller: _pc1,
      ),
      body: StreamBuilder(
        stream: Provider.of<TodoRepository>(context, listen: false)
            .getTodosStream(),
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
                TodoItemWrapper(
                    todoList: Utils.querySnapshotToTodoList(snapshot.data)),
                if (snapshot.data.size == 0)
                  const Center(
                    child: Text(
                      string_constants.noData,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  )
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
