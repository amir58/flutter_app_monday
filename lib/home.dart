import 'package:flutter/material.dart';
import 'package:flutter_app_monday/components.dart';
import 'package:flutter_app_monday/done_tasks_screen.dart';

import 'active_tasks_screen.dart';
import 'archive_tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomNavigationIndex = 0;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> titles = ["Active", "Done", "Archive"];
  List<Widget> screens = [
    ActiveTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titles[bottomNavigationIndex]),
      ),
      floatingActionButton: Visibility(
        visible: (bottomNavigationIndex == 0),
        child: FloatingActionButton(
          onPressed: () {
            // showSimpleBottomSheet();

            scaffoldKey.currentState.showBottomSheet((context) =>
                buildBottomSheetItem());
            },
          child: Icon(Icons.add),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        myTextFormField(controller: titleController, validator: (value) => null, label: "Title", prefixIcon: Icons.title),
        SizedBox(height: 10,),
        myTextFormField(controller: dateController, validator: (value) => null, label: "Date", prefixIcon: Icons.date_range),
        SizedBox(height: 10,),
        myTextFormField(controller: timeController, validator: (value) => null, label: "Time", prefixIcon: Icons.timer_outlined),
      ],),
    );
  }
}
