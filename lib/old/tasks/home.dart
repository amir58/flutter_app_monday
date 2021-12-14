import 'package:flutter/material.dart';
import 'package:flutter_app_monday/components.dart';
import 'package:flutter_app_monday/old/tasks/done_tasks_screen.dart';
import 'package:sqflite/sqflite.dart';

import 'active_tasks_screen.dart';
import 'archive_tasks_screen.dart';
import 'data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomNavigationIndex = 0;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  List<String> titles = ["Active", "Done", "Archive"];
  List<Widget> screens = [
    ActiveTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen(),
  ];

  bool isBottomSheetExpanded = false;

  _HomeScreenState() {
    print('Constructor run');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState run');
    openMyDatabase();
  }

  @override
  Widget build(BuildContext context) {
    print('Build run');
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titles[bottomNavigationIndex]),
      ),
      floatingActionButton: Visibility(
        visible: (bottomNavigationIndex == 0),
        child: FloatingActionButton(
          onPressed: () {
            if (isBottomSheetExpanded) {
              if (formKey.currentState.validate()) {
                String title = titleController.text;
                String date = dateController.text;
                String time = timeController.text;

                insertTask(title: title, date: date, time: time);
                Navigator.of(context).pop();
                isBottomSheetExpanded = false;
              }
            } else {
              scaffoldKey.currentState
                  .showBottomSheet((context) => buildBottomSheetItem())
                  .closed
                  .then((value) {
                isBottomSheetExpanded = false;

                titleController.text = "";
                dateController.text = "";
                timeController.text = "";

                setState(() {});
              });

              isBottomSheetExpanded = true;
              setState(() {});
            }
          },
          child: isBottomSheetExpanded ? Icon(Icons.add) : Icon(Icons.edit),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            print(value);
            bottomNavigationIndex = value;
            setState(() {});
          },
          currentIndex: bottomNavigationIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: "Active"),
            BottomNavigationBarItem(icon: Icon(Icons.done_all), label: "Done"),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive), label: "Archive"),
          ]),
      body: screens[bottomNavigationIndex],
    );
  }

  showSimpleBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
    );
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

  void insertTask({String title, String date, String time}) async {
    // Insert some records in a transaction
    await database.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO Tasks(title, date, time, status) VALUES("$title", "$date", "$time", "active")');
      print('RAW INSERT ID => $id');
      getTasks();
    });

  }

  void getTasks() async {
    activeTasks = await database.rawQuery('SELECT * FROM Tasks WHERE status = "active"');
    doneTasks = await database.rawQuery('SELECT * FROM Tasks WHERE status = "done"');
    archiveTasks = await database.rawQuery('SELECT * FROM Tasks WHERE status = "archive"');

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

  void deleteTask({int taskId}) async {
    await database.rawDelete('DELETE FROM Tasks WHERE id = ?', [taskId]);
  }

  void updateTask({String status, int taskId}) async {
    await database.rawUpdate(
        'UPDATE Tasks SET status = ? WHERE id = ?', ['$status', taskId]);
  }
}
