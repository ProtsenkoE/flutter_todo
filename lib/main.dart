import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/presentation/screens/splash_screen.dart';
import 'package:flutter_todo/presentation/screens/todo_wrapper_screen.dart';
import 'package:flutter_todo/config/string_constants.dart' as string_constant;
import 'package:provider/provider.dart';
import 'config/router.dart';
import 'data/store/firebase_store.dart';
import 'domain/repository/todo_repository.dart';

Future<void> main() async {
  RouterFluro.setupRouter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          TodoRepository(firebaseStore: FirebaseStore()),
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: RouterFluro.router.generator,
        title: string_constant.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TodosWrapperScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreen(),
    );
  }
}
