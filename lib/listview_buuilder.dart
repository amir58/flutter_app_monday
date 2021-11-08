import 'package:flutter/material.dart';

class MySimpleListView extends StatelessWidget {
  MySimpleListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder:  (context, index) {
          return Text(
            "Amir ${++index}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          );
        },
        itemCount: 1000,
      ),
    );
  }

}
