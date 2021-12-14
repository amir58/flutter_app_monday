import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_monday/news/models/news_response.dart';

class ScienceNewsScreen extends StatefulWidget {

  @override
  _ScienceNewsScreenState createState() => _ScienceNewsScreenState();
}

class _ScienceNewsScreenState extends State<ScienceNewsScreen> {

  List<Articles> articles = [];
  String _imageUrl = "https://aqaarplus.com/assets/uploads/default.png";

  getNews() {
    Dio()
        .get(
            "https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=fa72aea7f1af46a6a45be8aa23e21b64")
        .then((value) {
      NewsResponse response = NewsResponse.fromJson(value.data);
      articles = response.articles;

      setState(() {});
    }).catchError((error) {
      print('ERROR => $error');
    });
  }

  void getHttpNews() async {
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
      articles = news.articles;
      setState(() {});

    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttpNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: articles.isEmpty
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ListView.builder(
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300]),
                child: Column(
                  children: [
                    Image.network(articles[index].urlToImage ?? _imageUrl),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      articles[index].title,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              itemCount: articles.length,
            ),
    );
  }
}
