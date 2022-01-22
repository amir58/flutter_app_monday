import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_monday/basics/counter_screen.dart';
import 'package:flutter_app_monday/basics/login_screen.dart';
import 'package:flutter_app_monday/basics/messenager_screen.dart';
import 'package:flutter_app_monday/basics/second_screen.dart';
import 'package:flutter_app_monday/basics/stack_screen.dart';
import 'package:flutter_app_monday/e/my_dio.dart';
import 'package:flutter_app_monday/e/test.dart';
import 'package:flutter_app_monday/news/bloc/app_cubit.dart';
import 'package:flutter_app_monday/news/ui/mid_news_screen.dart';
import 'package:flutter_app_monday/news/ui/sports_news_screen.dart';
import 'package:flutter_app_monday/old/tasks/home.dart';
import 'package:flutter_app_monday/posts/posts_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc_home.dart';
import 'news/bloc/news_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MyDio.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit(InitAppState())..getThemeMode()),
        BlocProvider(
          create: (context) => NewsCubit(InitNewsState())
            ..getBusinessNews()
            ..getSportsNews()
            ..getTechnologyNews()
            ..getScienceNews(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: AppCubit.get(context).themeMode,
            home: TestScreen(),
          );
        },
      ),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      appBarTheme: AppBarTheme(
        color: Colors.blue,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.blue,
            statusBarIconBrightness: Brightness.light),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
      ),
      primarySwatch: Colors.brown,
      scaffoldBackgroundColor: Colors.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white),
      appBarTheme: AppBarTheme(
          color: Colors.black,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light)),
    );
  }
}
