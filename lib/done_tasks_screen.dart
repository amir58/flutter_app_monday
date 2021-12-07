import 'package:flutter/material.dart';
import 'package:flutter_app_monday/components.dart';
import 'package:flutter_app_monday/data.dart';

class DoneTasksScreen extends StatefulWidget {
  @override
  _DoneTasksScreenState createState() => _DoneTasksScreenState();
}

class _DoneTasksScreenState extends State<DoneTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return tasksListView(doneTasks, null);
  }
}
