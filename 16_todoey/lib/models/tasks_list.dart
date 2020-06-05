import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TasksListModel extends ChangeNotifier {
  final List<TaskModel> _tasks = [
    TaskModel(name: 'SEF'),
    TaskModel(name: 'OEP'),
    TaskModel(name: 'UCSAL'),
  ];

  int get length => _tasks.length;

  TaskModel get(index) => _tasks[index];

  void add(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }

  void remove(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
      notifyListeners();
    }
  }

  void toggleDoneOfTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].toggleDone();
      notifyListeners();
    }
  }
}
