import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_list.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TapDownDetails _tapPosition;

    return Consumer<TasksListModel>(
      builder: (context, tasks, child) => ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
              title: tasks.get(index).name,
              isChecked: tasks.get(index).isDone,
              onChanged: (newValue) => tasks.toggleDoneOfTask(index),
              onLongPressStart:
                  (LongPressStartDetails longPressStartDetails) async {
                final RenderBox overlay =
                    Overlay.of(context).context.findRenderObject();
                int selectedIndex = await showMenu(
                  context: context,
                  position: RelativeRect.fromRect(
                    longPressStartDetails.globalPosition &
                        Size(40, 40), // smaller rect, the touch area
                    Offset.zero &
                        overlay.size, // Bigger rect, the entire screen
                  ),
                  items: <PopupMenuEntry<int>>[
                    PopupMenuItem(
                      value: index,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.delete),
                          Text('Delete'),
                        ],
                      ),
                    )
                  ],
                );
                if (selectedIndex != null) {
                  tasks.remove(selectedIndex);
                }
              });
        },
      ),
    );
  }
}
