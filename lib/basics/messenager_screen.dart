import 'package:flutter/material.dart';
import 'package:flutter_app_monday/basics/user.dart';

class MessengerScreen extends StatelessWidget {
  MessengerScreen({Key key}) : super(key: key);

  List<MyUser> users = [
    MyUser("Nada", "Where are you ?", true),
    MyUser("Youssef", "How are you ?", true),
    MyUser("Mai", "I'll attend online today", false),
    MyUser("Somaya", "I'll coming", true),
  ];

  String _url =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Steve_Jobs_Headshot_2010-CROP2.jpg/1200px-Steve_Jobs_Headshot_2010-CROP2.jpg";

  @override
  Widget build(BuildContext context) {
    users.add(MyUser("Amir", "Hello", false));

    MyUser khalid = MyUser("Khalid", "HelloWorld!", false);
    users.add(khalid);

    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   leading: myLeading(),
      //   title: Text(
      //     "Chats",
      //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      //   ),
      //   actions: [
      //     myIconButton(Icons.camera_alt),
      //     myIconButton(Icons.edit),
      //   ],
      // ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        child: Column(
          children: [
            buildTopBar(),
            buildNotificationReminder(),
            buildSearch(),
            Expanded(child: ListView.builder(
              itemBuilder: (context, index) {
                print('INDEX => $index');
                return buildChatItem(index);
              },
              itemCount: users.length,
            )),
            // Expanded(
            //   child: ListView(
            //     children: [
            //       buildChatItem(),
            //       buildChatItem(),
            //       buildChatItem(),
            //       buildChatItem(),
            //       buildChatItem(),
            //       buildChatItem(),
            //       buildChatItem(),
            //       buildChatItem(),
            //       buildChatItem(),
            //       buildChatItem(),
            //       buildChatItem(),
            //     ],
            //   ),
            // ),
          ],
        ),
      )),
    );

  }

  Widget buildChatItem(int index) {
    MyUser myUser = users[index]; // 0

    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(_url),
            radius: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(myUser.username),
                Text(
                  myUser.lastMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Visibility(
            visible: myUser.notSeen,
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.search,
            color: Colors.grey[700],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextFormField(
            decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey[700])),
          )),
        ],
      ),
    );
  }

  Widget buildNotificationReminder() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      color: Colors.blue,
      child: Row(
        children: [
          Text(
            "All notification off until 1:00 PM",
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
          Text(
            "TURN ON",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildTopBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          myLeading(),
          SizedBox(
            width: 10,
          ),
          Text(
            "Chats",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Spacer(),
          myIconButton(Icons.camera_alt),
          SizedBox(
            width: 10,
          ),
          myIconButton(Icons.edit),
        ],
      ),
    );
  }

  Widget myLeading() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(_url),
            radius: 25,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 10,
          ),
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 9,
            child: Text("5"),
          ),
        ],
      ),
    );
  }

  Widget myIconButton(IconData iconData) {
    return CircleAvatar(
      backgroundColor: Colors.grey[300],
      child: IconButton(
          icon: Icon(
            iconData,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {}),
    );
  }
}
