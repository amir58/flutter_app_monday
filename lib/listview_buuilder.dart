import 'package:flutter/material.dart';
import 'package:flutter_app_monday/user.dart';

class MySimpleListView extends StatelessWidget {
  MySimpleListView({Key key}) : super(key: key);


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: Text(
              names[index],
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          );
        },
        itemCount: names.length,
      ),
    );
  }
}
