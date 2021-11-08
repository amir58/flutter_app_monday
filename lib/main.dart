import 'package:flutter/material.dart';
import 'package:flutter_app_monday/login_screen.dart';
import 'package:flutter_app_monday/persons_screen.dart';
import 'package:flutter_app_monday/second_screen.dart';
import 'package:flutter_app_monday/stack_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch : Colors.blue
      ),
      home: StackScreen(),
    );
  }
}


