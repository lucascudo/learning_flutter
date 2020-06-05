import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_list.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksListModel>(
      builder: (context, tasks, child) => ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            title: tasks.get(index).name,
            isChecked: tasks.get(index).isDone,
            onChanged: (newValue) {
              setState(() {
                tasks.get(index).toggleDone();
              });
            },
          );
        },
      ),
    );
  }
}
