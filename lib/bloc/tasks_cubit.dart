import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../archive_tasks_screen.dart';
import '../data.dart';
import '../done_tasks_screen.dart';
import 'bloc_active_tasks_screen.dart';
import 'bloc_archive_tasks_screen.dart';
import 'bloc_done_tasks_screen.dart';

class TasksStates {}

class InitTasksState extends TasksStates {}

class BottomNavigationChangeState extends TasksStates {}

class BottomSheetChangeState extends TasksStates {}

class InsertTaskState extends TasksStates {}

class DeleteTaskState extends TasksStates {}

class GetTasksState extends TasksStates {}

class TasksCubit extends Cubit<TasksStates> {
  TasksCubit(TasksStates initialState) : super(initialState);

  static TasksCubit get(context) => BlocProvider.of(context);

  List<String> titles = ["Active", "Done", "Archive"];
  List<Widget> screens = [
    BlocActiveTasksScreen(),
    BlocDoneTasksScreen(),
    BlocArchiveTasksScreen(),
  ];

  int bottomNavigationIndex = 0;
  bool isBottomSheetExpanded = false;

  void changeBottomNavigationState(int value) {
    bottomNavigationIndex = value;
    emit(BottomNavigationChangeState());
  }

  void changeBottomSheetState(bool value) {
    isBottomSheetExpanded = value;
    emit(BottomSheetChangeState());
  }

  // Open database
  // Insert records
  // Get records
  // Update records
  // Delete records
  Database database;

  void openMyDatabase() async {
    // open the database
    // Database database = await openDatabase("databaseName", version: 1,
    //     onCreate: (Database db, int version) async {
    //       // When creating the db, create the table
    //       await db.execute(
    //           'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    //     });

    database = await openDatabase(
      "tasksDatabase",
      version: 1,
      onCreate: (db, version) async {
        print('onCreate');
        await db.execute(
            "CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)");
      },
      onOpen: (db) {
        print('onOpen');
        database = db;
        getTasks();
      },
    );
  }

  void insertTask({String title, String date, String time, String status = "active"}) async {
    // Insert some records in a transaction
    await database.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO Tasks(title, date, time, status) VALUES("$title", "$date", "$time", "$status")');
      print('RAW INSERT ID => $id');
      getTasks();
    });
  }

  List<Map> activeTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  void getTasks() async {
    activeTasks =
        await database.rawQuery('SELECT * FROM Tasks WHERE status = "active"');
    doneTasks =
        await database.rawQuery('SELECT * FROM Tasks WHERE status = "done"');
    archiveTasks =
        await database.rawQuery('SELECT * FROM Tasks WHERE status = "archive"');

    emit(GetTasksState());

    // await database.rawQuery('SELECT * FROM Tasks').then((value) {
    //       value.forEach((element) {
    //           if(element['status'] == "active"){
    //             activeTasks.add(element);
    //           }
    //           else if(element['status'] == "done"){
    //             doneTasks.add(element);
    //           }
    //           else if(element['status'] == "archive"){
    //             archiveTasks.add(element);
    //           }
    //       });
    // });
  }

  Map<dynamic, dynamic> _deletedTask;

  void deleteTask({Map<dynamic, dynamic> task}) async {
    _deletedTask = task;

    await database.rawDelete('DELETE FROM Tasks WHERE id = ?', [task['id']]);
    emit(DeleteTaskState());
    getTasks();
  }

  void updateTask({String status, int taskId}) async {
    await database.rawUpdate(
        'UPDATE Tasks SET status = ? WHERE id = ?', ['$status', taskId]);

    getTasks();
  }

  void undoDeletedTask() {
    insertTask(
      title: _deletedTask['title'],
      date: _deletedTask['date'],
      time: _deletedTask['time'],
      status: _deletedTask['status'],
    );
  }
}
