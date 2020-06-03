import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 30,
          right: 30,
          bottom: 60,
        ),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              child: Icon(
                Icons.list,
                size: 30,
              ),
              backgroundColor: Colors.white,
              radius: 30,
            ),
            Text('Todoey'),
          ],
        ),
      ),
    );
  }
}
