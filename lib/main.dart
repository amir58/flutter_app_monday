import 'package:flutter/material.dart';
import 'package:flutter_app_monday/basics/counter_screen.dart';
import 'package:flutter_app_monday/basics/login_screen.dart';
import 'package:flutter_app_monday/basics/messenager_screen.dart';
import 'package:flutter_app_monday/basics/second_screen.dart';
import 'package:flutter_app_monday/basics/stack_screen.dart';
import 'package:flutter_app_monday/news/mid_news_screen.dart';
import 'package:flutter_app_monday/news/sports_news_screen.dart';
import 'package:flutter_app_monday/old/tasks/home.dart';
import 'package:flutter_app_monday/posts/posts_screen.dart';

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
      home: MidNewsScreen(),
    );
  }

}


