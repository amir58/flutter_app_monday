import 'package:flutter/material.dart';
import 'package:flutter_app_monday/bloc/tasks_cubit.dart';
import 'package:flutter_app_monday/components.dart';
import 'package:flutter_app_monday/old/tasks/done_tasks_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../old/tasks/archive_tasks_screen.dart';
import '../old/tasks/data.dart';
import 'bloc_active_tasks_screen.dart';

class BlocHomeScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  BuildContext context;
  TasksCubit cubit;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print('initState run');
  //   openMyDatabase();
  // }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return BlocProvider(
      create: (context) => TasksCubit(InitTasksState())..openMyDatabase(),
      child: BlocConsumer<TasksCubit, TasksStates>(
        listener: (context, state) {
          print(state);
          print(state is BottomSheetChangeState);
          if (state is BottomSheetChangeState) {
          } else if (state is InsertTaskState) {
          } else if (state is DeleteTaskState) {
            snackBar();
          }
        },
        builder: (context, state) {
          cubit = TasksCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.bottomNavigationIndex]),
            ),
            floatingActionButton: Visibility(
              visible: (cubit.bottomNavigationIndex == 0),
              child: FloatingActionButton(
                onPressed: () {

                  if (cubit.isBottomSheetExpanded) {
                    if (formKey.currentState.validate()) {
                      String title = titleController.text;
                      String date = dateController.text;
                      String time = timeController.text;

                      cubit.insertTask(title: title, date: date, time: time);
                      Navigator.of(context).pop();
                      cubit.isBottomSheetExpanded = false;
                    }
                  } else {
                    scaffoldKey.currentState
                        .showBottomSheet((context) => buildBottomSheetItem())
                        .closed
                        .then((value) {
                      titleController.text = "";
                      dateController.text = "";
                      timeController.text = "";

                      cubit.changeBottomSheetState(false);
                      // setState(() {});
                    });

                    cubit.changeBottomSheetState(true);
                    // setState(() {});
                  }
                },
                child: cubit.isBottomSheetExpanded
                    ? Icon(Icons.add)
                    : Icon(Icons.edit),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                onTap: (value) {
                  cubit.changeBottomNavigationState(value);
                  // setState(() {});
                },
                currentIndex: cubit.bottomNavigationIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard), label: "Active"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.done_all), label: "Done"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.archive), label: "Archive"),
                ]),
            body: cubit.screens[cubit.bottomNavigationIndex],
          );
        },
      ),
    );
  }

  snackBar(){
    final snackBar = SnackBar(
      duration: Duration(seconds: 3),
      content: Text('Task deleted'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
          cubit.undoDeletedTask();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }

  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  buildBottomSheetItem() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            myTextFormField(
                controller: titleController,
                validator: (value) => validator(value),
                label: "Title",
                prefixIcon: Icons.title),
            SizedBox(
              height: 10,
            ),
            myTextFormField(
              controller: dateController,
              validator: (value) => validator(value),
              label: "Date",
              prefixIcon: Icons.date_range,
              textInputType: TextInputType.none,
              onTap: () {
                print('Date tapped');
                _pickDateDialog();
              },
            ),
            SizedBox(
              height: 10,
            ),
            myTextFormField(
              controller: timeController,
              validator: (value) => validator(value),
              label: "Time",
              prefixIcon: Icons.timer_outlined,
              textInputType: TextInputType.none,
              onTap: () {
                print('Time tapped');
                _pickTimeDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  String validator(String value) {
    if (value.isEmpty) {
      return "Required";
    }
    return null;
  }

  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(2000),
            //what will be the previous supported year in picker
            lastDate: DateTime(
                2022)) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      print('date picker dialog');
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      print(pickedDate.toString().split(" ")[0]);
      dateController.text = pickedDate.toString().split(" ")[0];
    });

    print('end date picker dialog');
  }

  void _pickTimeDialog() async {
    TimeOfDay initialTime = TimeOfDay.now();
    TimeOfDay pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget child) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: child,
        );
      },
    );
    print('time picker');
    String realHour = (pickedTime.hour > 12)
        ? "${pickedTime.hour - 12}:${pickedTime.minute} PM"
        : "${pickedTime.hour}:${pickedTime.minute} AM";

    String time = "${realHour}";
    timeController.text = time;
  }
}
