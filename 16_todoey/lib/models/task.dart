class TaskModel {
  final String name;
  bool isDone;

  TaskModel({this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
