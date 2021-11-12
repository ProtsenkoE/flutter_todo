import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

// TODO
List<Todo> getTodoList() {
  final List<Todo> todoList = [
    Todo(
        title: 'Math',
        isChecked: true,
        image:
            'https://www.avsim.su/forum/uploads/monthly_2020_10/asdasd.png.0087405eb0bf8c517b1ba4b1d5769ee7.png'),
    Todo(
        title: 'Architecture',
        isChecked: false,
        image:
            'https://www.cnet.com/a/img/liJ9UZA87zs1viJiuEfVnL7YYfw=/940x0/2020/05/18/5bac8cc1-4bd5-4496-a8c3-66a6cd12d0cb/fb-avatar-2.jpg'),
    Todo(
        title: 'Biology',
        isChecked: false,
        image:
            'https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg'),
    Todo(
        title: 'Math',
        isChecked: false,
        image:
            'https://www.cnet.com/a/img/liJ9UZA87zs1viJiuEfVnL7YYfw=/940x0/2020/05/18/5bac8cc1-4bd5-4496-a8c3-66a6cd12d0cb/fb-avatar-2.jpg'),
    Todo(
        title: 'Architecture',
        isChecked: false,
        image:
            'https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg'),
    Todo(title: 'Biology', isChecked: false, image: ''),
    Todo(title: 'Math', isChecked: false, image: ''),
    Todo(title: 'Architecture', isChecked: false, image: ''),
  ];

  return todoList;
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
      body: SafeArea(
        child: Stack(
          children: [
            const TopBar(),
            TodoItemWrapper(todoList: getTodoList()),
          ],
        ),
      ),
      borderRadius: radius,
    );
  }
}
