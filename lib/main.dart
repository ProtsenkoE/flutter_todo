import 'package:flutter/material.dart';
import 'package:flutter_todo/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var todoItems = [
    'Math',
    'Architecture',
    'Biology',
    'Flutter',
    'Artificial Intelligences',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoItems.length,
          itemBuilder: (context, index) {
            var item = todoItems[index];
            return Todo(title: item);
          },
        ),
      ),
    );
  }
}
