import 'package:flutter/material.dart';
import 'package:flutter_app_monday/basics/messenager_screen.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int sliderCounter = 160;
  bool isMale = true;

  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(0),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.black,
              height: 10,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          isMale = true;
                          print('Male => $isMale');

                          setState(() {

                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // (condition) ? true : false
                        color: (isMale) ? Colors.blue : Colors.grey,
                      ),
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(
                          //   Icons.phone,
                          //   size: 88,
                          // ),
                          Image.asset("images/male.png",height: 75,),
                          SizedBox(height: 5,),
                          Text(
                            "Male",
                            style: TextStyle(fontSize: 33),
                          )
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          isMale = false;
                          print('Male => $isMale');

                          setState(() {

                          });
                    },
                        child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: (isMale) ? Colors.grey : Colors.pink,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(
                          //   Icons.phone,
                          //   size: 88,
                          // ),
                          Image.asset("images/female.png", height: 75,),
                          Text(
                            "Female",
                            style: TextStyle(fontSize: 33),
                          )
                        ],
                    ),
                    margin: EdgeInsets.all(10),
                  ),
                      )),
                ],
              ),
            )),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: TextStyle(fontSize: 33),
                  ),
                  Text(
                    "$sliderCounter Cm",
                    style: TextStyle(fontSize: 25),
                  ),
                  Slider(
                    value: sliderCounter.toDouble(),
                    min: 150,
                    max: 200,
                    onChanged: (value) {
                      sliderCounter = value.toInt();
                      print(value);

                      setState(() {

                      });
                    },
                  )
                ],
              ),
            )),
            Expanded(
                child: Container(
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: TextStyle(fontSize: 33),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "$weight KG",
                          style: TextStyle(fontSize: 28),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              child: InkWell(
                                  child: Icon(Icons.remove),
                                onTap: () {
                                  weight--;
                                  setState(() {

                                  });
                                },
                              ),
                            ),
                            CircleAvatar(
                              child: InkWell(
                                  onTap: () {
                                    weight++;
                                    setState(() {

                                    });
                                  },
                                  child: Icon(Icons.add)),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: TextStyle(fontSize: 33),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "$age",
                          style: TextStyle(fontSize: 28),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              child: InkWell(
                                  onTap : (){
                                    age--;
                                    setState(() {

                                    });
                                  },
                                  child: Icon(Icons.remove)),
                            ),
                            CircleAvatar(
                              child: InkWell(
                                  onTap: () {
                                    age++;
                                    setState(() {

                                    });
                                  },
                                  child: Icon(Icons.add)),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            )),
            Container(
              width: double.infinity,
              color: Colors.red,
              child: MaterialButton(
                onPressed: () {
                  showCustomDialog();
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MessengerScreen(),));
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showCustomDialog(){
    Dialog customDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: 300.0,
        width: 300.0,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(15.0),
              child: Text('Cool', style: TextStyle(color: Colors.red),),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('Awesome', style: TextStyle(color: Colors.red),),
            ),
            Padding(padding: EdgeInsets.only(top: 50.0)),
            TextButton(onPressed: () {
              Navigator.of(context).pop();
            },
                child: Text('Got It!', style: TextStyle(color: Colors.purple, fontSize: 18.0),))
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => customDialog);
  }

}
