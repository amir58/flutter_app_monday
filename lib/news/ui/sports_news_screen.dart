import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_monday/news/bloc/news_cubit.dart';
import 'package:flutter_app_monday/news/components/components.dart';
import 'package:flutter_app_monday/news/models/news_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsNewsScreen extends StatelessWidget {
  NewsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        cubit = NewsCubit.get(context);
        return Scaffold(
          body: newsBody(cubit.sportsArticles, cubit.imageUrl),
        );
      },
      listener: (context, state) {

      },
    );
  }

}
