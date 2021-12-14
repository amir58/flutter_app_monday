import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_monday/components.dart';
import 'package:flutter_app_monday/old/tasks/data.dart';

class ActiveTasksScreen extends StatefulWidget {
  @override
  _ActiveTasksScreenState createState() => _ActiveTasksScreenState();
}

class _ActiveTasksScreenState extends State<ActiveTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return tasksListView(activeTasks, null);
  }

}
