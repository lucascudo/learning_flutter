import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TasksListModel extends ChangeNotifier {
  final List<TaskModel> _tasks = [
    TaskModel(name: 'SEF'),
    TaskModel(name: 'OEP'),
    TaskModel(name: 'UCSAL'),
  ];

  UnmodifiableListView<TaskModel> get tasks => UnmodifiableListView(_tasks);

  int get length => _tasks.length;

  TaskModel get(index) => _tasks[index];

  void add(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleDoneOfTask(index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }
}
