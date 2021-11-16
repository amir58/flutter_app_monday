import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  // var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if(value.isEmpty){
                    return "Email required";
                  }
                  if(!value.contains('@') || !value.contains(".")){
                    return "Enter a valid email";
                  }
                  return null;
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 10,),
              MaterialButton(
                onPressed: () {
                  if(formKey.currentState.validate()){
                    print('Validate');
                  }
                  // if(email.isEmpty){
                  //   print('Email is empty');
                  // }

                },
                color: Colors.green,
                child: Text("Send"),
                textColor: Colors.white,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
