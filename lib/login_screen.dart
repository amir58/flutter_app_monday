import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Amir App"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => print('Favorite pressed'),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search pressed');
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: onMorePress,
          ),
        ],
      ),
      drawer: Drawer(),
      endDrawer: Drawer(),
      floatingActionButton: FloatingActionButton(onPressed: () {}),

      body: Column(
        children: [
          Text(
            "HelloWorld!",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 22,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("This is my first app")
        ],
      ),
    );
  }

  void onMorePress() {
    print('More pressed');
  }
}
