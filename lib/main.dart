import 'package:flutter/material.dart';
import 'package:flutter_app_monday/basics/counter_screen.dart';
import 'package:flutter_app_monday/basics/login_screen.dart';
import 'package:flutter_app_monday/basics/messenager_screen.dart';
import 'package:flutter_app_monday/basics/second_screen.dart';
import 'package:flutter_app_monday/basics/stack_screen.dart';
import 'package:flutter_app_monday/home.dart';

import 'bloc/bloc_home.dart';

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
      home: BlocHomeScreen(),
    );
  }

}


