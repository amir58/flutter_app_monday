import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      endDrawer: Drawer(),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  "Login Screen ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Forget password",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.green,
                child: Text("Login"),
                textColor: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Does not have account ?"),
                  Text("Sign Up",style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ), ),
                ],
              ),

           ],
          ),
        ),
      ),
    );
  }

  void onMorePress() {
    print('More pressed');
  }
}
