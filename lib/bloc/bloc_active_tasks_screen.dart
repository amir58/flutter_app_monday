import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_monday/bloc/tasks_cubit.dart';
import 'package:flutter_app_monday/components.dart';
import 'package:flutter_app_monday/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocActiveTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        TasksCubit cubit = TasksCubit.get(context);

        return tasksListView(cubit.activeTasks, cubit);
      },
    );
  }



}
