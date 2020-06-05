import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function onChanged;
  final Function onLongPressStart;
  TaskTile({this.title, this.isChecked, this.onChanged, this.onLongPressStart});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: onLongPressStart,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            decoration: (isChecked) ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
