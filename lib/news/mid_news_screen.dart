import 'package:flutter/material.dart';
import 'package:flutter_app_monday/news/models/business_news_screen.dart';
import 'package:flutter_app_monday/news/models/news_response.dart';
import 'package:flutter_app_monday/news/models/science_news_screen.dart';
import 'package:flutter_app_monday/news/models/technology_news_screen.dart';
import 'package:flutter_app_monday/news/sports_news_screen.dart';
import 'package:flutter_app_monday/news/sports_news_screen.dart';

class MidNewsScreen extends StatefulWidget {
  const MidNewsScreen({Key key}) : super(key: key);

  @override
  _MidNewsScreenState createState() => _MidNewsScreenState();
}

class _MidNewsScreenState extends State<MidNewsScreen> {
  int _index = 0;
  List<String> categories = ["Business", "Sports", "Technology", "Science"];
  List<Widget> screens = [
    BusinessNewsScreen(),
    SportsNewsScreen(),
    TechnologyNewsScreen(),
    ScienceNewsScreen(),
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(categories[_index]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          _index = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: categories[0]),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_baseball), label: categories[1]),
          BottomNavigationBarItem(
              icon: Icon(Icons.biotech), label: categories[2]),
          BottomNavigationBarItem(
              icon: Icon(Icons.science), label: categories[3]),
        ],
      ),
      body: screens[_index],
    );
  }
}
