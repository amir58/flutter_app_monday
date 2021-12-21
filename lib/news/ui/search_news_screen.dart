import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_monday/components.dart';
import 'package:flutter_app_monday/news/components/components.dart';
import 'package:flutter_app_monday/news/models/news_response.dart';

class SearchNewsScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SearchNewsScreen> {
  var searchController = TextEditingController();
  String imageUrl = "https://aqaarplus.com/assets/uploads/default.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              myTextFormField(
                textInputAction: TextInputAction.search,
                controller: searchController,
                validator: (value) {
                  if (value.isEmpty) return "Write search key";
                  return null;
                },
                label: "Search",
                prefixIcon: Icons.search,
                onFieldSubmitted: (value) {
                  if (value.isEmpty) {
                    print("Write search key");
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Write search key", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),)));
                    return;
                  }

                  search(value);
                },
              ),
              Visibility(
                visible: isSearching,
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
              Expanded(child: searchBody(searchArticles, imageUrl))
            ],
          ),
        ),
      ),
    );
  }

  bool isSearching = false;
  List<Articles> searchArticles = [];

  void search(String value) async {
    // https://newsapi.org/v2/everything?q=tesla&from=2021-11-21&sortBy=publishedAt&apiKey=fa72aea7f1af46a6a45be8aa23e21b64

    setState(() {
      isSearching = true;
    });

    try {
      var response = await Dio().get(
        'https://newsapi.org/v2/everything',
        queryParameters: {
          "q": "$value",
          "from": "2021-11-21",
          "sortBy": "publishedAt",
          "apiKey": "fa72aea7f1af46a6a45be8aa23e21b64",
        },
      );

      NewsResponse news = NewsResponse.fromJson(response.data);
      searchArticles = news.articles;
      setState(() {
        isSearching = false;
      });

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

}
