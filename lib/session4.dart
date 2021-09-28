// loops => break , continue
// list
// map
// functions
// class object

import 'dart:io';

void main() {
  // loops();
  list();
  // map();
  //
  // sumAndPrint();
  //
  // int result = sumWithReturn();
  // print(result);
  //
  // sumWithParameters(10, 10);
  // sumWithParameters(10, 20);
  // sumWithParameters(10, 30);
  // sumWithParameters(30, 20);
  // sumWithParameters(10, 60);
  // sumWithParameters(80, 20);
}

void loops() {
  for (int x = 0; x < 10; x++) {
    if (x == 5) {
      break;
    }

    print(x);
  }

  for (int x = 0; x < 5; x++) {
    if (x == 3) {
      continue;
    }

    print(x);
  }
}

void list() {
  List<String> names = [];

  for (int x = 0; x < 3; x++) {
    print('Enter name ${x + 1} : ');
    String name = stdin.readLineSync();
    names.add(name);
  }

  print(names);

  for (int x = 0; x < names.length; x++) {
    print('Name ${x + 1} : ${names[x]}');
  }

  names.forEach((element) {
    print(element);
  });
}

void map() {
  print('- - - - - - - - - - - - -');
  // List []
  // Map {}

  var loginBody = <String, dynamic>{};
  //         key       value
  loginBody['name'] = "Amir Mohammed";
  loginBody['email'] = "amir@gmail.com";
  loginBody['address'] = "Cairo";
  loginBody['phone'] = "01116036522";

  print(loginBody);

  print('Name : ${loginBody['name']}');
  print(loginBody['phone']);
}

// nested functions
// camelCase =>  main , getData , printOurNames
// Syntax
// returnType funName ( parameters ){ function body }

// returnTypes => void , dataType

void sumAndPrint() {
  int numberOne = 10;
  int numberTwo = 15;
  int result = numberOne + numberTwo;
  print(result);
}

void sumWithParameters(int numberOne, int numberTwo) {
  int result = numberOne + numberTwo;
  print(result);
}

void multi(int numberOne, int numberTwo) {
  int result = numberOne * numberTwo;
  print(result);
}

void calculate() {
  String inputOne = stdin.readLineSync();
  int numberOne = int.tryParse(inputOne);

  String inputTwo = stdin.readLineSync();
  int numberTwo = int.tryParse(inputTwo);

  sumWithParameters(numberOne, numberTwo);
  multi(numberOne, numberTwo);
}

int sumWithReturn() {
  int numberOne = 10;
  int numberTwo = 20;
  int result = numberOne + numberTwo;
  return result;
}
