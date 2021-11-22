import 'package:flutter/material.dart';
import 'package:flutter_app_monday/basics/user.dart';

class MySimpleListView extends StatefulWidget {
  MySimpleListView({Key key}) : super(key: key);

  @override
  _MySimpleListViewState createState() => _MySimpleListViewState();
}

class _MySimpleListViewState extends State<MySimpleListView> {
  List<String> names = [
    'Amir',
    'Khaled',
    'Hallt',
    'Mai',
    'Nada',
    'Somaya',
    'Youssef',
    'Amir',
    'Khaled',
    'Hallt',
    'Mai',
    'Nada',
    'Somaya',
    'Youssef',
    'Amir',
    'Khaled',
    'Hallt',
    'Mai',
    'Nada',
    'Somaya',
    'Youssef',
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if(index == selectedIndex){
                selectedIndex = -1;
              }
              else{
                selectedIndex = index;
              }

              setState(() {

              });
            },
            
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: (index == selectedIndex) ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Text(
                names[index],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
          );
        },
        itemCount: names.length,
      ),
    );
  }
}
