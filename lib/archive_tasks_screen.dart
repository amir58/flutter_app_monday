import 'package:flutter/material.dart';
import 'package:flutter_app_monday/components.dart';

class ArchiveTasksScreen extends StatefulWidget {
  @override
  _ArchiveTasksScreenState createState() => _ArchiveTasksScreenState();
}

class _ArchiveTasksScreenState extends State<ArchiveTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return tasksListView();
  }
}
