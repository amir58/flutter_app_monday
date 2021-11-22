import 'package:flutter/material.dart';

// 1 :  alt + enter => to convert from stateless to stateful
class CounterScreen extends StatefulWidget {
  CounterScreen({Key key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("$counter", style: TextStyle(fontSize: 44),),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          print('$counter');
          // 2 :  call setState => to refresh UI
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
