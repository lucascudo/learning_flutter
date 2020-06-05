import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_list.dart';
import 'package:todoey/screens/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksListModel(),
      child: MaterialApp(
        title: 'Todoey',
        home: TasksScreen(),
      ),
    );
  }
}
