import 'package:flutter/material.dart';
import 'package:todo_list_practice/List/insertList.dart';
import 'package:todo_list_practice/List/tableList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': ((context) {
          return TableList();
        }),
        '/insert': (context) {
          return InsertList();
        }
      },
    );
  }
}
