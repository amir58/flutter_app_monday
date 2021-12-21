import 'package:flutter/material.dart';
import 'package:flutter_app_monday/news/bloc/news_cubit.dart';
import 'package:flutter_app_monday/news/ui/business_news_screen.dart';
import 'package:flutter_app_monday/news/models/news_response.dart';
import 'package:flutter_app_monday/news/ui/science_news_screen.dart';
import 'package:flutter_app_monday/news/ui/search_news_screen.dart';
import 'package:flutter_app_monday/news/ui/technology_news_screen.dart';
import 'package:flutter_app_monday/news/ui/sports_news_screen.dart';
import 'package:flutter_app_monday/news/ui/sports_news_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MidNewsScreen extends StatelessWidget {
  NewsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(InitNewsState())..getBusinessNews()
        ..getSportsNews()..getTechnologyNews()..getScienceNews(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.categories[cubit.index]),
              actions: [
                IconButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchNewsScreen(),));
                }, icon: Icon(Icons.search))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.index,
              onTap: (value) {
                cubit.changeNavigationIndex(value);
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: cubit.categories[0]),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports_baseball), label: cubit.categories[1]),
                BottomNavigationBarItem(
                    icon: Icon(Icons.biotech), label: cubit.categories[2]),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science), label: cubit.categories[3]),
              ],
            ),
            body: cubit.screens[cubit.index],
          );
        },
      ),
    );
  }
}
