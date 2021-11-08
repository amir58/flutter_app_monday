import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(0),
        width: double.infinity,
        child: Column(
          children: [
            //
            Expanded(child: Container(color: Colors.black, height: 10,
            child: Row(children: [
              Expanded(child: Container(color: Colors.blue, margin: EdgeInsets.all(10),)),
              Expanded(child: Container(color: Colors.green,margin: EdgeInsets.all(10),)),
            ],),
            )),
            Expanded(child: Container(color: Colors.red, margin: EdgeInsets.all(10),)),
            Expanded(child: Container(color: Colors.black,)),
            Expanded(child: Container(color: Colors.red,)),
          ],
        ),
      ),
    );
  }
}
