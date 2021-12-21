import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_monday/news/models/news_response.dart';
import 'package:flutter_app_monday/news/ui/business_news_screen.dart';
import 'package:flutter_app_monday/news/ui/science_news_screen.dart';
import 'package:flutter_app_monday/news/ui/sports_news_screen.dart';
import 'package:flutter_app_monday/news/ui/technology_news_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsStates {}

class InitNewsState extends NewsStates {}

class GetNewsState extends NewsStates {}

class ChangeNewsNavigationState extends NewsStates {}


class NewsCubit extends Cubit<NewsStates> {
  NewsCubit(initialState) : super(initialState);

  static NewsCubit get(context) => BlocProvider.of(context);

  int index = 0;
  List<String> categories = ["Business", "Sports", "Technology", "Science"];
  List<Widget> screens = [
    BusinessNewsScreen(),
    SportsNewsScreen(),
    TechnologyNewsScreen(),
    ScienceNewsScreen(),
  ];

  void changeNavigationIndex(index) {
    this.index = index;
    emit(ChangeNewsNavigationState());
  }

  List<Articles> businessArticles = [];
  String imageUrl = "https://aqaarplus.com/assets/uploads/default.png";

  void getBusinessNews() async {
    try {
      var response = await Dio().get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          "country": "eg",
          "category": "business",
          "apiKey": "fa72aea7f1af46a6a45be8aa23e21b64",
        },
      );

      NewsResponse news = NewsResponse.fromJson(response.data);
      businessArticles = news.articles;
      // setState(() {});
      emit(GetNewsState());
    } catch (e) {
      print(e);
    }
  }

  List<Articles> sportsArticles = [];

  void getSportsNews() async {
    try {
      var response = await Dio().get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          "country": "eg",
          "category": "sports",
          "apiKey": "fa72aea7f1af46a6a45be8aa23e21b64",
        },
      );

      NewsResponse news = NewsResponse.fromJson(response.data);
      sportsArticles = news.articles;
      // setState(() {});
      emit(GetNewsState());

    } catch (e) {
      print(e);
    }
  }

  List<Articles> technologyArticles = [];

  void getTechnologyNews() async {
    try {
      // https://newsapi.org/v2/top-headlines?country=eg&category=technology&apiKey=fa72aea7f1af46a6a45be8aa23e21b64
      var response = await Dio().get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          "country": "eg",
          "category": "technology",
          "apiKey": "fa72aea7f1af46a6a45be8aa23e21b64",
        },
      );

      NewsResponse news = NewsResponse.fromJson(response.data);
      technologyArticles = news.articles;
      emit(GetNewsState());

    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print('catched');
        print(e.response.data['message']);
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        print('check your connection');
        return;
      }

      if (e.type == DioErrorType.receiveTimeout) {
        print('unable to connect to the server');
        return;
      }

      if (e.type == DioErrorType.other) {
        print('Something went wrong');
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  List<Articles> scienceArticles = [];

  void getScienceNews() async {
    try {
      var response = await Dio().get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          "country":"eg",
          "category": "science",
          "apiKey":"fa72aea7f1af46a6a45be8aa23e21b64",
        },
      );

      NewsResponse news = NewsResponse.fromJson(response.data);
      scienceArticles = news.articles;
      // setState(() {});
      emit(GetNewsState());

    } catch (e) {
      print(e);
    }
  }



}


