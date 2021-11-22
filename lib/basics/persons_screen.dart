import 'package:flutter/material.dart';

class PersonsScreen extends StatelessWidget {
  String _url =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Steve_Jobs_Headshot_2010-CROP2.jpg/1200px-Steve_Jobs_Headshot_2010-CROP2.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Persons"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildPerson(name: "Khaled"),
              buildPerson(name: "Amir"),
              buildPerson(name: "Youssef"),
              buildPerson(),
              buildPerson(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPerson({String name = "Steve jobs"}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(_url),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.blue),
          ),
        ],
      ),
    );
  }

}
