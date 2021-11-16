import 'package:flutter/material.dart';
import 'components.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool passwordVisible = true;

  // var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              myTextFormField(
                controller: nameController,
                validator: (value) => _nameValidator(value),
                label: "Name",
                prefixIcon: Icons.person,
              ),
              TextFormField(
                validator: (value) => _nameValidator(value),
                controller: nameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) => _emailValidator(value),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  return _passwordValidator(value);
                },
                controller: passwordController,
                obscureText: passwordVisible,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: _changePasswordVisibility,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              myTextFormField(
                controller: confirmPasswordController,
                validator: (value) => _confirmPasswordValidator(value),
                label: "Confirm password",
                prefixIcon: Icons.lock,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) => _confirmPasswordValidator(value),
                obscureText: passwordVisible,
                controller: confirmPasswordController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirm password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: _changePasswordVisibility,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    print('Validate');
                  }
                  // if(email.isEmpty){
                  //   print('Email is empty');
                  // }
                },
                color: Colors.green,
                child: Text("Register"),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changePasswordVisibility() {
    passwordVisible = !passwordVisible;

    setState(() {});
  }

  String _nameValidator(String value) {
    if (value.isEmpty) {
      return "Name required";
    }
    if (value.length < 2) {
      return "Enter a valid name";
    }
    return null;
  }

  String _emailValidator(String value) {
    if (value.isEmpty) {
      return "Email required";
    }
    if (!value.contains('@') || !value.contains(".")) {
      return "Enter a valid email";
    }
    return null;
  }

  String _passwordValidator(String value) {
    if (value.isEmpty) {
      return "Password required";
    }
    if (value.length < 6) {
      return "Password must be 6 characters at least";
    }
    return null;
  }

  String _confirmPasswordValidator(String value) {
    if (value.isEmpty) {
      return "Password required";
    }
    if (value.length < 6) {
      return "Password must be 6 characters at least";
    }
    if (passwordController.text != value) {
      return "Password not match";
    }
    return null;
  }
}
