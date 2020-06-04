import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final Function onChanged;

  TasksList({this.tasks, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          title: tasks[index].name,
          isChecked: tasks[index].isDone,
          onChanged: (newValue) => onChanged(index),
        );
      },
    );
  }
}
