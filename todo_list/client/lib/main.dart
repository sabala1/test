import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list/constants/mongoDB.dart';
import 'package:todo_list/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoBD.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: 'Test',
      home: Home(),
    );
  }

}
