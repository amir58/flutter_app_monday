import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_monday/e/categories_response.dart';
import 'package:flutter_app_monday/e/login_response.dart';
import 'package:flutter_app_monday/e/my_dio.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    login(email: "amir4@senior.com", password: "123456");

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
    );
  }

  void login({String email, String password}) {
    Dio dio = Dio(BaseOptions(
      baseUrl: "https://student.valuxapps.com/api/",
      headers: {
        "lang": "ar",
      },
    ));

    dio.post(
      "login",
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      LoginResponse response = LoginResponse.fromJson(value.data);

      if (response.status) {
        // success
        print(response.data.token);
      } else {
        // failed

      }
    });
  }

  void login2({String email, String password}) {
    MyDio.postData(
      endPoint: "login",
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      LoginResponse response = LoginResponse.fromJson(value.data);

      if (response.status) {
        print(response.data.token);
      } else {
        print(response.message);
      }
    });

    MyDio.getData(endPoint: "categories").then((value) {
      CategoriesResponse response = CategoriesResponse.fromJson(value.data);

      if(response.status){
        print(response.data.data.length);
      }

    });
  }
}
